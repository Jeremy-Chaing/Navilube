table 99121 Team
{
    Caption = 'Team';
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(20; "Team Name"; Text)
        {
            Caption = 'Team Name';
        }
        field(30; "Team Colors"; Text)
        {
            Caption = 'Team Colors';
        }
        field(40; "Manager Code"; Code)
        {
            Caption = 'Manager Code';
        }
        field(50; "Manager Name"; Text)
        {
            Caption = 'Manager Name';
        }
        field(60; "Activated Status"; Boolean)
        {
            Caption = 'Activated Status';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
