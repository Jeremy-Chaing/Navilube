table 99499 "Service Log"
{
    Caption = 'Service Log';
    DataClassification = ToBeClassified;

    DrillDownPageID = "Service Log Entries";

    fields
    {
        field(10; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(20; VIN; Code[20])
        {
            Caption = 'VIN';
            TableRelation = Vehicle."VIN";
        }
        field(30; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(40; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer."No." WHERE(Blocked = CONST("Customer Blocked"::" "));
        }
        field(50; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(60; "Fluids Checked"; Boolean)
        {
            Caption = 'Fluids Checked';
        }
        field(70; Mileage; Integer)
        {
            Caption = 'Mileage';
            trigger OnValidate()
            begin
                "Next Service Mileage" := "Mileage" + 3000;
            end;
        }
        field(80; "Next Service Mileage"; Integer)
        {
            Caption = 'Next Service Mileage';
        }
    }
    keys
    {
        key(PK; "Line No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        "Date" := Today;
    end;
}
