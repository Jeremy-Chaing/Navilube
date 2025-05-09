page 99124 "Recent Games Subform"
{
    Caption = 'Recent Games';
    PageType = ListPart;
    SourceTable = "Game Result";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the game date.';
                }
                field("Home Team"; Rec."Home Team")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the home team.';
                }
                field("Guest Team"; Rec."Guest Team")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the guest team.';
                }
                field("Home Point"; Rec."Home Point")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the home team points.';
                }
                field("Guest Point"; Rec."Guest Point")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the guest team points.';
                }
                field("Win Team"; Rec."Win Team")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the winning team.';
                }
            }
        }
    }
}