page 99128 "Game Result Card"
{
    Caption = 'Game Result Card';
    PageType = Card;
    SourceTable = "Game Result";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Game No."; Rec."Game No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the game number.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the game date.';
                }
                field(Season; Rec.Season)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the season.';
                }
            }
            group("Match Details")
            {
                Caption = 'Match Details';

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
                    StyleExpr = HomePointStyle;
                }
                field("Guest Point"; Rec."Guest Point")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the guest team points.';
                    StyleExpr = GuestPointStyle;
                }
            }
            group(Result)
            {
                Caption = 'Result';

                field("Win Team"; Rec."Win Team")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the winning team.';
                    Style = Favorable;
                }
                field("Lose Team"; Rec."Lose Team")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the losing team.';
                    Style = Unfavorable;
                }
            }
        }
    }

    var
        HomePointStyle: Text;
        GuestPointStyle: Text;

    trigger OnAfterGetRecord()
    begin
        if Rec."Home Point" > Rec."Guest Point" then begin
            HomePointStyle := 'Favorable';
            GuestPointStyle := 'Unfavorable';
        end else if Rec."Home Point" < Rec."Guest Point" then begin
            HomePointStyle := 'Unfavorable';
            GuestPointStyle := 'Favorable';
        end else begin
            HomePointStyle := 'Ambiguous';
            GuestPointStyle := 'Ambiguous';
        end;
    end;
}