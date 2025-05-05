table 99498 Vehicle
{
    Caption = 'Vehicle';
    DataClassification = ToBeClassified;
    LookupPageID = "Vehicle List";

    fields
    {
        field(10; VIN; Code[20])
        {
            Caption = 'VIN';

        }
        field(20; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            Editable = false;
            TableRelation = Customer."No." WHERE(Blocked = CONST("Customer Blocked"::" "));
        }
        field(30; Description; Text[30])
        {
            Caption = 'Description';
        }
        field(40; Transmission; Option)
        {
            Caption = 'Transmission';
            OptionMembers = Automatic,"4-Speed","5-Speed",Other;
        }
        field(50; "Total Service Visits"; Integer)
        {
            Caption = 'Total Service Visits';
            FieldClass = FlowField;
            CalcFormula = Count("Service Log" WHERE("VIN" = FIELD("VIN")));
        }
        field(60; "Total Service Dollars"; Decimal)
        {
            Caption = 'Total Service Dollars';
            // 透過 Sum 方法指定計算 Service Log 表中 Amount 欄位的總和
            FieldClass = FlowField;
            CalcFormula = Sum("Service Log"."Amount" WHERE("VIN" = FIELD("VIN")));
        }
    }
    keys
    {
        key(PK; VIN)
        {
            Clustered = true;
        }
    }
}
