table 99122 Pledge
{
    Caption = 'Pledge';
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
        field(30; "Pledge Date"; Date)
        {
            Caption = 'Pledge Date';
        }
        field(40; "Pledge Amount"; Decimal)
        {
            Caption = 'Pledge Amount';
            MinValue = 25;
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
