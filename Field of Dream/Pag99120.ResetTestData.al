page 99129 "Reset Test Data"
{
    ApplicationArea = All;
    Caption = 'Reset Test Data';
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(ResetData; ResetData)
                {
                    ApplicationArea = All;
                    Caption = 'Click to Reset Test Data';
                    ToolTip = 'Resets and initializes all test data.';

                    trigger OnDrillDown()
                    var
                        InitTestData: Codeunit "Init Test Data";
                        CompanyInfo: Record "Company Information";
                    begin
                        if Confirm('Are you sure you want to reset all test data?') then begin
                            // Reset the initialization flag
                            if CompanyInfo.Get() then begin
                                CompanyInfo."VAT Registration No." := '';
                                CompanyInfo.Modify();
                            end;

                            // Run initialization
                            InitTestData.InitializeTestData();
                            Message('Test data has been reset and initialized successfully.');
                        end;
                    end;
                }
            }
        }
    }

    var
        ResetData: Boolean;
}