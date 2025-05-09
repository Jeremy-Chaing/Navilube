report 99120 "Import Data"
{
    Caption = 'Import Data';
    ProcessingOnly = true;
    UseRequestPage = true;

    dataset
    {
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(ImportType; ImportType)
                    {
                        ApplicationArea = All;
                        Caption = 'Import Type';
                        OptionCaption = 'Team,Sponsor';
                    }
                    field(FileName; FileName)
                    {
                        ApplicationArea = All;
                        Caption = 'Excel File';
                        Editable = false;
                        ToolTip = 'Specifies the path of the file to import.';

                        trigger OnAssistEdit()
                        var
                            FileManagement: Codeunit "File Management";
                            InStreamVar: InStream;
                            OutStreamVar: OutStream;
                            TempBlob: Codeunit "Temp Blob";
                        begin
                            UploadIntoStream('Select Excel File', '', 'Excel Files (*.xlsx)|*.xlsx|All Files (*.*)|*.*', FileName, InStreamVar);
                            if FileName = '' then
                                exit;
                            TempBlob.CreateOutStream(OutStreamVar);
                            CopyStream(OutStreamVar, InStreamVar);
                            ExcelBuffer.OpenBookStream(TempBlob.CreateInStream(), 'Sheet1');
                            ExcelBuffer.ReadSheet();
                        end;
                    }
                }
            }
        }
    }

    var
        ExcelBuffer: Record "Excel Buffer" temporary;
        FileName: Text;
        ImportType: Option Team,Sponsor;

    trigger OnPreReport()
    begin
        if FileName = '' then
            Error('Please select a file to import.');

        case ImportType of
            ImportType::Team:
                ImportTeamData();
            ImportType::Sponsor:
                ImportSponsorData();
        end;
    end;

    local procedure ImportTeamData()
    var
        BaseballTeam: Record "Baseball Team";
        RowNo: Integer;
        LastRow: Integer;
    begin
        ExcelBuffer.SetRange("Row No.");
        if ExcelBuffer.FindLast() then
            LastRow := ExcelBuffer."Row No.";

        for RowNo := 2 to LastRow do begin
            BaseballTeam.Init();
            BaseballTeam.Code := GetExcelValue(RowNo, 1);
            if BaseballTeam.Code = '' then
                break;
            BaseballTeam."Team Name" := GetExcelValue(RowNo, 2);
            BaseballTeam."Team Colors" := GetExcelValue(RowNo, 3);
            BaseballTeam."Manager Code" := GetExcelValue(RowNo, 4);
            BaseballTeam."Activated Status" := true;
            if not BaseballTeam.Insert() then
                BaseballTeam.Modify();
        end;
    end;

    local procedure ImportSponsorData()
    var
        Sponsor: Record Sponsor;
        RowNo: Integer;
        LastRow: Integer;
    begin
        ExcelBuffer.SetRange("Row No.");
        if ExcelBuffer.FindLast() then
            LastRow := ExcelBuffer."Row No.";

        for RowNo := 2 to LastRow do begin
            Sponsor.Init();
            Sponsor."Sponsor Number" := GetExcelValue(RowNo, 1);
            if Sponsor."Sponsor Number" = '' then
                break;
            Sponsor."Sponsor's Name" := GetExcelValue(RowNo, 2);
            Sponsor."Sponsor's Address" := GetExcelValue(RowNo, 3);
            Sponsor."Active Status" := true;
            Evaluate(Sponsor."Join Date", GetExcelValue(RowNo, 4));
            Evaluate(Sponsor."Sponsorship Level", GetExcelValue(RowNo, 5));
            Sponsor."Sponsor Team" := GetExcelValue(RowNo, 6);
            if not Sponsor.Insert() then
                Sponsor.Modify();
        end;
    end;

    local procedure GetExcelValue(RowNo: Integer; ColNo: Integer): Text
    begin
        ExcelBuffer.SetRange("Row No.", RowNo);
        ExcelBuffer.SetRange("Column No.", ColNo);
        if ExcelBuffer.FindFirst() then
            exit(ExcelBuffer."Cell Value as Text");
        exit('');
    end;
}