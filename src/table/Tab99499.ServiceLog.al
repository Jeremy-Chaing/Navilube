table 99499 "Service Log"
{
    Caption = 'Service Log';
    DataClassification = ToBeClassified;

    //DrillDownPageID = "Service Log Entries";

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

            //選擇VIN後帶出Vehicle table有的資料 ex.Customer No.
            trigger OnValidate()
            var
                VehicleRec: Record Vehicle;
            begin
                if VIN <> '' then begin
                    if VehicleRec.Get(VIN) then
                        "Customer No." := VehicleRec."Customer No.";
                end;
            end;
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
            DecimalPlaces = 2 : 2;
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
        key(PK; "VIN", "Line No.")
        {
            Clustered = true;
        }

        key(VINIndex; "VIN")
        {
            SumIndexFields = "Amount";
        }
    }

    //VIN(Key值)不得為空
    trigger OnInsert()
    begin
        if VIN = '' then
            Error('新增維修紀錄時，車身號碼 (VIN) 不得為空。');

        "Date" := Today;
    end;
}
