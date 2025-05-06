namespace NaviLube.NaviLube;

page 99499 "Service Log Entries"
{
    ApplicationArea = All;
    Caption = 'Service Log Entries';
    PageType = List;
    SourceTable = "Service Log";
    UsageCategory = Lists;
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
                field(VIN; Rec.VIN)
                {
                    ToolTip = 'Specifies the value of the VIN field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.', Comment = '%';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.', Comment = '%';
                }
                field("Fluids Checked"; Rec."Fluids Checked")
                {
                    ToolTip = 'Specifies the value of the Fluids Checked field.', Comment = '%';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                }
                field(Mileage; Rec.Mileage)
                {
                    ToolTip = 'Specifies the value of the Mileage field.', Comment = '%';
                }
                field("Next Service Mileage"; Rec."Next Service Mileage")
                {
                    ToolTip = 'Specifies the value of the Next Service Mileage field.', Comment = '%';
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
            }
        }
    }
}
