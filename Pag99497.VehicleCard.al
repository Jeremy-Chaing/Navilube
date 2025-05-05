namespace NaviLube.NaviLube;

page 99497 "Vehicle Card"
{
    ApplicationArea = All;
    Caption = 'Vehicle Card';
    PageType = Card;
    SourceTable = Vehicle;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

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
                field(VIN; Rec.VIN)
                {
                    ToolTip = 'Specifies the value of the VIN field.', Comment = '%';
                }
            }
        }
    }
}
