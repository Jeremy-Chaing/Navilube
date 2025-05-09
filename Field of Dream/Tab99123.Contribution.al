table 99123 Contribution
{
    Caption = 'Contribution';
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;
        }
        field(20; "Sponsor No."; Code[20])
        {
            Caption = 'Sponsor No.';
            TableRelation = Sponsor;
        }
        field(30; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(40; "Contribution Date"; Date)
        {
            Caption = 'Contribution Date';
        }
        field(50; "Contribution Amount"; Decimal)
        {
            Caption = 'Contribution Amount';
        }
    }
    keys
    {
        key(PK; "Line No.")
        {
            Clustered = true;
        }
        key(SponsorNo; "Sponsor No.")
        {
        }
    }
}
