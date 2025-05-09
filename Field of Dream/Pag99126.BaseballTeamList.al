page 99126 "Baseball Team List"
{
    Caption = 'Baseball Team List';
    PageType = List;
    SourceTable = "Baseball Team";
    CardPageId = "Baseball Team Card";
    Editable = false;
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1)
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
        }
    }
}