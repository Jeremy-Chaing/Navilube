table 99120 "Sponsor Number"
{
    Caption = 'Sponsor Number';
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "Sponsor Number"; Code[20])
        {
            Caption = 'Sponsor Number';
        }
        field(20; "Sponsor's Name"; Text)
        {
            Caption = 'Sponsor''s Name';
        }
        field(30; "Sponsor's Address"; Text)
        {
            Caption = 'Sponsor''s Address';
        }
        field(40; "Active Status"; Boolean)
        {
            Caption = 'Active Status';
        }
        field(50; "Join Date"; Date)
        {
            Caption = 'Join Date';
        }
        field(60; "Sponsorship Level"; Enum)
        {
            Caption = 'Sponsorship Level';
        }
        field(70; "Sponsor Team"; Text)
        {
            Caption = 'Sponsor Team';
        }
        field(80; "Marital Status"; Enum)
        {
            Caption = 'Marital Status';
        }
        field(90; "Number of Children"; in)
        {
            Caption = 'Number of Children';
        }
    }
    keys
    {
        key(PK; "Sponsor Number")
        {
            Clustered = true;
        }
    }
}
