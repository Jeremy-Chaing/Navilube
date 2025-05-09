page 99125 "Sponsor List"
{
    Caption = 'Sponsor List';
    PageType = List;
    SourceTable = Sponsor;
    CardPageId = "Sponsor Card";
    Editable = false;
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Sponsor Number"; Rec."Sponsor Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the sponsor number.';
                }
                field("Sponsor's Name"; Rec."Sponsor's Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the sponsor name.';
                }
                field("Active Status"; Rec."Active Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if the sponsor is active.';
                }
                field("Join Date"; Rec."Join Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the join date.';
                }
                field("Sponsorship Level"; Rec."Sponsorship Level")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the sponsorship level.';
                }
                field("Sponsor Team"; Rec."Sponsor Team")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Baseball Team Card";
                    ToolTip = 'Specifies the sponsor team.';
                }
                field("Total Pledge Amount"; Rec."Total Pledge Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the total pledge amount.';
                }
                field("Total Contribution Amount"; Rec."Total Contribution Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the total contribution amount.';
                }
            }
        }
    }
}