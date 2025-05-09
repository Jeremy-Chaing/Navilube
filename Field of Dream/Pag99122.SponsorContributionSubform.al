page 99122 "Sponsor Contribution Subform"
{
    Caption = 'Contributions';
    PageType = ListPart;
    SourceTable = Contribution;
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
                field("Contribution Date"; Rec."Contribution Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the contribution date.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description.';
                }
                field("Contribution Amount"; Rec."Contribution Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the contribution amount.';
                }
            }
        }
    }
}