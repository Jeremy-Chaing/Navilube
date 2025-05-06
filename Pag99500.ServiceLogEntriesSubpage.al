namespace NaviLube.NaviLube;

page 99500 "Service Log Entries Subpage"
{
    ApplicationArea = All;
    Caption = 'Service Log Entries Subpage';
    PageType = ListPart;
    SourceTable = "Service Log";
    AutoSplitKey = true;


    //允許CUD
    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = true;



    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Amount; Rec.Amount)
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Date"; Rec."Date")
                {
                }
                field("Fluids Checked"; Rec."Fluids Checked")
                {
                }
                field("Line No."; Rec."Line No.")
                {
                }
                field(Mileage; Rec.Mileage)
                {
                }
                field("Next Service Mileage"; Rec."Next Service Mileage")
                {
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                }
                field(SystemId; Rec.SystemId)
                {
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                }

            }
        }

    }

    actions
    {
        area(processing)
        {
            action(ShowSubpageFilter)
            {
                Caption = '顯示 Service Log 子頁 Filter';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Message('目前子頁 VIN Filter: %1', Rec.GetFilter("VIN"));
                end;
            }
        }
    }
}
