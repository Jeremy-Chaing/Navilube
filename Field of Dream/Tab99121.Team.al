table 99121 "Baseball Team"
{
    Caption = 'Baseball Team';
    DataClassification = ToBeClassified;

    fields
    {
        field(10; Code; Code[20])
        {
            Caption = 'Code';
        }
        field(20; "Team Name"; Text[100])
        {
            Caption = 'Team Name';
        }
        field(30; "Team Colors"; Text[100])
        {
            Caption = 'Team Colors';
        }
        field(40; "Manager Code"; Code[20])
        {
            Caption = 'Manager Code';
            TableRelation = "Salesperson/Purchaser";
        }
        field(50; "Manager Name"; Text[100])
        {
            Caption = 'Manager Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Salesperson/Purchaser".Name where(Code = field("Manager Code")));
        }
        field(60; "Activated Status"; Boolean)
        {
            Caption = 'Activated Status';
            InitValue = true;
        }
    }
    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }
}
