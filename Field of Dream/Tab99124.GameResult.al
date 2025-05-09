table 99124 "Game Result"
{
    Caption = 'Game Result';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Game No."; Code[20])
        {
            Caption = 'Game No.';
        }
        field(2; Season; Integer)
        {
            Caption = 'Season';
        }
        field(3; "Home Team"; Code[20])
        {
            Caption = 'Home Team';
            TableRelation = "Baseball Team";

            trigger OnValidate()
            begin
                if not InsertingRecord then
                    if xRec."Home Team" <> '' then
                        Error('比賽對戰組合一旦建立就不能修改');

                if "Guest Team" <> '' then
                    if "Home Team" = "Guest Team" then
                        FieldError("Home Team", '主場和客場球隊不能相同');
            end;
        }
        field(4; "Guest Team"; Code[20])
        {
            Caption = 'Guest Team';
            TableRelation = "Baseball Team";

            trigger OnValidate()
            begin
                if not InsertingRecord then
                    if xRec."Guest Team" <> '' then
                        Error('比賽對戰組合一旦建立就不能修改');

                if "Home Team" <> '' then
                    if "Home Team" = "Guest Team" then
                        FieldError("Guest Team", '主場和客場球隊不能相同');
            end;
        }
        field(5; "Home Point"; Integer)
        {
            Caption = 'Home Point';
            MinValue = 0;

            trigger OnValidate()
            begin
                UpdateWinLoseTeam();
            end;
        }
        field(6; "Guest Point"; Integer)
        {
            Caption = 'Guest Point';
            MinValue = 0;

            trigger OnValidate()
            begin
                UpdateWinLoseTeam();
            end;
        }
        field(7; Date; Date)
        {
            Caption = 'Date';
        }
        field(8; "Win Team"; Code[20])
        {
            Caption = 'Win Team';
            TableRelation = "Baseball Team";
            Editable = false;
        }
        field(9; "Lose Team"; Code[20])
        {
            Caption = 'Lose Team';
            TableRelation = "Baseball Team";
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Game No.")
        {
            Clustered = true;
        }
        key(Date; Date)
        {
        }
        key(Teams; "Home Team", "Guest Team")
        {
        }
    }

    var
        InsertingRecord: Boolean;

    trigger OnInsert()
    begin
        InsertingRecord := true;
        TestField("Home Team");
        TestField("Guest Team");
        if "Home Team" = "Guest Team" then
            Error('主場和客場球隊不能相同');

        UpdateWinLoseTeam();
    end;

    trigger OnModify()
    begin
        InsertingRecord := false;
        // 防止透過其他方式修改球隊
        TestField("Home Team", xRec."Home Team");
        TestField("Guest Team", xRec."Guest Team");
    end;

    local procedure UpdateWinLoseTeam()
    begin
        if "Home Point" > "Guest Point" then begin
            "Win Team" := "Home Team";
            "Lose Team" := "Guest Team";
        end else if "Home Point" < "Guest Point" then begin
            "Win Team" := "Guest Team";
            "Lose Team" := "Home Team";
        end else begin
            Clear("Win Team");
            Clear("Lose Team");
        end;
    end;
}