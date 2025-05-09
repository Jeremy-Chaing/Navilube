page 99120 "Sponsor Card"
{
    Caption = 'Sponsor Card';
    PageType = Card;
    SourceTable = Sponsor;

    layout
    {
        area(content)
        {
            group(General)
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
                field("Sponsor's Address"; Rec."Sponsor's Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the sponsor address.';
                    MultiLine = true;
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
                    ToolTip = 'Specifies the sponsor team.';
                    TableRelation = "Baseball Team";
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the marital status.';
                }
                field("Number of Children"; Rec."Number of Children")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of children.';
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
            part(PledgeLines; "Sponsor Pledge Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Sponsor No." = field("Sponsor Number");
            }
            part(ContributionLines; "Sponsor Contribution Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Sponsor No." = field("Sponsor Number");
            }
        }
    }
}