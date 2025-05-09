page 99121 "Sponsor Pledge Subform"
{
    Caption = 'Pledges';
    PageType = ListPart;
    SourceTable = Pledge;
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the line number.';
                    Visible = false;
                }
                field("Pledge Date"; Rec."Pledge Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the pledge date.';
                }
                field("Pledge Amount"; Rec."Pledge Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the pledge amount.';
                }
            }
        }
    }
}