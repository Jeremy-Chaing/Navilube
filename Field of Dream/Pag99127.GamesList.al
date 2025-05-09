page 99127 "Games List"
{
    Caption = 'Games List';
    PageType = List;
    SourceTable = "Game Result";
    CardPageId = "Game Result Card";  // 我們稍後會創建這個卡片頁面
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1)
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
                    StyleExpr = PointStyle;
                }
                field("Guest Point"; Rec."Guest Point")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the guest team points.';
                    StyleExpr = PointStyle;
                }
                field("Win Team"; Rec."Win Team")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the winning team.';
                }
            }
        }
    }

    var
        PointStyle: Text;

    trigger OnAfterGetRecord()
    begin
        // 設定分數的顯示樣式
        if Rec."Home Point" > Rec."Guest Point" then
            PointStyle := 'Favorable'
        else if Rec."Home Point" < Rec."Guest Point" then
            PointStyle := 'Unfavorable'
        else
            PointStyle := 'Ambiguous';
    end;
}