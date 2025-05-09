report 99121 "Sponsor Report"
{
    Caption = 'Sponsor Report';
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/SponsorReport.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(Sponsor; Sponsor)
        {
            DataItemTableView = sorting("Sponsor Number");
            RequestFilterFields = "Sponsor Number", "Sponsor's Name", "Sponsor Team";
            column(CompanyName; CompanyProperty.DisplayName()) { }
            column(SponsorNumber; "Sponsor Number") { }
            column(SponsorName; "Sponsor's Name") { }
            column(SponsorAddress; "Sponsor's Address") { }
            column(JoinDate; "Join Date") { }
            column(SponsorshipLevel; "Sponsorship Level") { }
            column(SponsorTeam; "Sponsor Team") { }
            column(TotalPledgeAmount; "Total Pledge Amount") { }
            column(TotalContributionAmount; "Total Contribution Amount") { }

            dataitem(Pledge; Pledge)
            {
                DataItemLink = "Sponsor No." = field("Sponsor Number");
                DataItemTableView = sorting("Sponsor No.", "Line No.");
                column(PledgeDate; "Pledge Date") { }
                column(PledgeAmount; "Pledge Amount") { }
            }

            dataitem(Contribution; Contribution)
            {
                DataItemLink = "Sponsor No." = field("Sponsor Number");
                DataItemTableView = sorting("Sponsor No.", "Line No.");
                column(ContributionDate; "Contribution Date") { }
                column(ContributionAmount; "Contribution Amount") { }
                column(Description; Description) { }
            }
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                }
            }
        }
    }

    var
        ReportHeader: Label 'Sponsor Report';
        PageNoCaption: Label 'Page';
        TotalCaption: Label 'Total';
}