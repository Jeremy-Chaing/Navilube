namespace NaviLube.NaviLube;

page 99498 "Vehicle List"
{
    ApplicationArea = All;
    Caption = 'Vehicle List';
    PageType = List;
    SourceTable = Vehicle;
    UsageCategory = Lists;

    Editable = false; // 禁止直接修改
    CardPageID = "Vehicle Card"; // 點一下就跳到卡片頁

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(VIN; Rec.VIN)
                {
                    ToolTip = 'Specifies the value of the VIN field.', Comment = '%';

                    ApplicationArea = All;
                    DrillDown = true;

                    trigger OnDrillDown()
                    var
                        VehicleCardPage: Page "Vehicle Card";
                    begin
                        VehicleCardPage.SetRecord(Rec);
                        VehicleCardPage.Run();
                    end;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.', Comment = '%';
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.', Comment = '%';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.', Comment = '%';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.', Comment = '%';
                }
                field("Total Service Dollars"; Rec."Total Service Dollars")
                {
                    ToolTip = 'Specifies the value of the Total Service Dollars field.', Comment = '%';
                }
                field("Total Service Visits"; Rec."Total Service Visits")
                {
                    ToolTip = 'Specifies the value of the Total Service Visits field.', Comment = '%';
                }
                field(Transmission; Rec.Transmission)
                {
                    ToolTip = 'Specifies the value of the Transmission field.', Comment = '%';
                }

            }
        }
    }

    //按鈕顯示某車所有維修紀錄
    actions
    {
        area(Processing)
        {
            action(ViewServiceLogs)
            {
                Caption = '檢視維修紀錄';
                ApplicationArea = All;

                trigger OnAction()
                var
                    ServiceLogPage: Page "Service Log Entries";
                    FilterRec: Record "Service Log";
                begin
                    FilterRec.SetRange("VIN", Rec."VIN");
                    ServiceLogPage.SetTableView(FilterRec);
                    ServiceLogPage.Run();
                end;
            }
        }
    }
}
