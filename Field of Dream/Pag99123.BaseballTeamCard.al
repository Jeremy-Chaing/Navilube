page 99123 "Baseball Team Card"
{
    Caption = 'Baseball Team Card';
    PageType = Card;
    SourceTable = "Baseball Team";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the team code.';
                }
                field("Team Name"; Rec."Team Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the team name.';
                }
                field("Team Colors"; Rec."Team Colors")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the team colors.';
                }
                field("Manager Code"; Rec."Manager Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the manager code.';
                }
                field("Manager Name"; Rec."Manager Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the manager name.';
                }
                field("Activated Status"; Rec."Activated Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if the team is active.';
                }
            }
            part(RecentGames; "Recent Games Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Home Team" = field(Code);
                SubPageView = sorting(Date) order(descending);
            }
        }
    }
}