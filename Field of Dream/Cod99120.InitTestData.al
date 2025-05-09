codeunit 99120 "Init Test Data"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    begin
        if IsTestDataInitialized() then
            exit;

        InitializeTestData();
    end;

    procedure InitializeTestData()
    begin
        InitializeTeams();
        InitializeSponsors();
        InitializePledges();
        InitializeContributions();
        InitializeGameResults();
        SetTestDataInitialized();
    end;

    local procedure InitializeTeams()
    var
        BaseballTeam: Record "Baseball Team";
    begin
        BaseballTeam.DeleteAll();

        InsertTeam('NYY', 'New York Yankees', 'Navy Blue and White', 'SP001');
        InsertTeam('BOS', 'Boston Red Sox', 'Red and Navy Blue', 'SP002');
        InsertTeam('LAD', 'Los Angeles Dodgers', 'Royal Blue and White', 'SP003');
        InsertTeam('CHC', 'Chicago Cubs', 'Blue and Red', 'SP004');
        InsertTeam('SFG', 'San Francisco Giants', 'Orange and Black', 'SP005');
    end;

    local procedure InsertTeam(TeamCode: Code[20]; TeamName: Text[100]; TeamColors: Text[100]; ManagerCode: Code[20])
    var
        BaseballTeam: Record "Baseball Team";
    begin
        BaseballTeam.Init();
        BaseballTeam.Code := TeamCode;
        BaseballTeam."Team Name" := TeamName;
        BaseballTeam."Team Colors" := TeamColors;
        BaseballTeam."Manager Code" := ManagerCode;
        BaseballTeam."Activated Status" := true;
        BaseballTeam.Insert();
    end;

    local procedure InitializeSponsors()
    var
        Sponsor: Record Sponsor;
    begin
        Sponsor.DeleteAll();

        InsertSponsor('SP001', 'John Smith', '123 Main St., New York', 'NYY', "Sponsorship Level"::Rookie);
        InsertSponsor('SP002', 'Mary Johnson', '456 Park Ave., Boston', 'BOS', "Sponsorship Level"::"Major League");
        InsertSponsor('SP003', 'Robert Davis', '789 Beach Rd., Los Angeles', 'LAD', "Sponsorship Level"::"All-Star");
        InsertSponsor('SP004', 'Lisa Brown', '321 Lake St., Chicago', 'CHC', "Sponsorship Level"::"Hall-of-Fame");
        InsertSponsor('SP005', 'Michael Wilson', '654 Hill Ave., San Francisco', 'SFG', "Sponsorship Level"::Rookie);
    end;

    local procedure InsertSponsor(SponsorNo: Code[20]; Name: Text[100]; Address: Text[250]; TeamCode: Code[20]; Level: Enum "Sponsorship Level")
    var
        Sponsor: Record Sponsor;
        MaritalStatus: Enum "Marital Status";
    begin
        Sponsor.Init();
        Sponsor."Sponsor Number" := SponsorNo;
        Sponsor."Sponsor's Name" := Name;
        Sponsor."Sponsor's Address" := Address;
        Sponsor."Active Status" := true;
        Sponsor."Join Date" := WorkDate();
        Sponsor."Sponsorship Level" := Level;
        Sponsor."Sponsor Team" := TeamCode;
        Sponsor."Marital Status" := MaritalStatus::Single;
        Sponsor."Number of Children" := Random(3);
        Sponsor.Insert();
    end;

    local procedure InitializePledges()
    var
        Pledge: Record Pledge;
        SponsorNo: Code[20];
        i: Integer;
    begin
        Pledge.DeleteAll();

        for i := 1 to 5 do begin
            SponsorNo := StrSubstNo('SP%1', Format(i, 3, '<Integer,3><Filler Character,0>'));
            InsertPledge(SponsorNo, WorkDate() - 60, 1000);
            InsertPledge(SponsorNo, WorkDate() - 30, 2000);
        end;
    end;

    local procedure InsertPledge(SponsorNo: Code[20]; PledgeDate: Date; Amount: Decimal)
    var
        Pledge: Record Pledge;
    begin
        Pledge.Init();
        Pledge."Sponsor No." := SponsorNo;
        Pledge."Pledge Date" := PledgeDate;
        Pledge."Pledge Amount" := Amount;
        Pledge.Insert(true);
    end;

    local procedure InitializeContributions()
    var
        Contribution: Record Contribution;
        SponsorNo: Code[20];
        i: Integer;
    begin
        Contribution.DeleteAll();

        for i := 1 to 5 do begin
            SponsorNo := StrSubstNo('SP%1', Format(i, 3, '<Integer,3><Filler Character,0>'));
            InsertContribution(SponsorNo, WorkDate() - 45, 'First Quarter Contribution', 500);
            InsertContribution(SponsorNo, WorkDate() - 15, 'Second Quarter Contribution', 750);
        end;
    end;

    local procedure InsertContribution(SponsorNo: Code[20]; ContribDate: Date; Desc: Text[100]; Amount: Decimal)
    var
        Contribution: Record Contribution;
    begin
        Contribution.Init();
        Contribution."Sponsor No." := SponsorNo;
        Contribution."Contribution Date" := ContribDate;
        Contribution.Description := Desc;
        Contribution."Contribution Amount" := Amount;
        Contribution.Insert(true);
    end;

    local procedure InitializeGameResults()
    var
        GameResult: Record "Game Result";
    begin
        GameResult.DeleteAll();

        // NYY vs BOS (6場)
        InsertGame('G001', 'NYY', 'BOS', 5, 3, WorkDate() - 30);
        InsertGame('G002', 'BOS', 'NYY', 4, 6, WorkDate() - 25);
        InsertGame('G003', 'NYY', 'BOS', 7, 2, WorkDate() - 20);
        InsertGame('G004', 'BOS', 'NYY', 3, 5, WorkDate() - 15);
        InsertGame('G005', 'NYY', 'BOS', 4, 4, WorkDate() - 10);
        InsertGame('G006', 'BOS', 'NYY', 6, 3, WorkDate() - 5);

        // NYY vs LAD (6場)
        InsertGame('G007', 'NYY', 'LAD', 3, 2, WorkDate() - 29);
        InsertGame('G008', 'LAD', 'NYY', 5, 4, WorkDate() - 24);
        InsertGame('G009', 'NYY', 'LAD', 6, 6, WorkDate() - 19);
        InsertGame('G010', 'LAD', 'NYY', 4, 3, WorkDate() - 14);
        InsertGame('G011', 'NYY', 'LAD', 7, 5, WorkDate() - 9);
        InsertGame('G012', 'LAD', 'NYY', 2, 4, WorkDate() - 4);

        // BOS vs LAD (6場)
        InsertGame('G013', 'BOS', 'LAD', 4, 2, WorkDate() - 28);
        InsertGame('G014', 'LAD', 'BOS', 3, 5, WorkDate() - 23);
        InsertGame('G015', 'BOS', 'LAD', 6, 6, WorkDate() - 18);
        InsertGame('G016', 'LAD', 'BOS', 5, 4, WorkDate() - 13);
        InsertGame('G017', 'BOS', 'LAD', 3, 2, WorkDate() - 8);
        InsertGame('G018', 'LAD', 'BOS', 4, 5, WorkDate() - 3);

        // CHC vs SFG (6場)
        InsertGame('G019', 'CHC', 'SFG', 5, 3, WorkDate() - 27);
        InsertGame('G020', 'SFG', 'CHC', 4, 6, WorkDate() - 22);
        InsertGame('G021', 'CHC', 'SFG', 3, 3, WorkDate() - 17);
        InsertGame('G022', 'SFG', 'CHC', 5, 4, WorkDate() - 12);
        InsertGame('G023', 'CHC', 'SFG', 6, 2, WorkDate() - 7);
        InsertGame('G024', 'SFG', 'CHC', 3, 5, WorkDate() - 2);

        // NYY vs SFG (3場)
        InsertGame('G025', 'NYY', 'SFG', 4, 2, WorkDate() - 26);
        InsertGame('G026', 'SFG', 'NYY', 3, 5, WorkDate() - 16);
        InsertGame('G027', 'NYY', 'SFG', 6, 4, WorkDate() - 6);

        // BOS vs CHC (3場)
        InsertGame('G028', 'BOS', 'CHC', 5, 5, WorkDate() - 21);
        InsertGame('G029', 'CHC', 'BOS', 4, 3, WorkDate() - 11);
        InsertGame('G030', 'BOS', 'CHC', 6, 4, WorkDate() - 1);
    end;

    local procedure InsertGame(GameNo: Code[20]; HomeTeam: Code[20]; GuestTeam: Code[20]; HomePoint: Integer; GuestPoint: Integer; GameDate: Date)
    var
        GameResult: Record "Game Result";
    begin
        GameResult.Init();
        GameResult."Game No." := GameNo;
        GameResult.Season := Date2DMY(WorkDate(), 3);
        GameResult."Home Team" := HomeTeam;
        GameResult."Guest Team" := GuestTeam;
        GameResult."Home Point" := HomePoint;
        GameResult."Guest Point" := GuestPoint;
        GameResult.Date := GameDate;
        GameResult.Insert();
    end;

    [NonDebuggable]
    local procedure IsTestDataInitialized(): Boolean
    var
        CompanyInfo: Record "Company Information";
    begin
        CompanyInfo.Get();
        exit(CompanyInfo."VAT Registration No." = 'TEST-DATA-INIT');
    end;

    [NonDebuggable]
    local procedure SetTestDataInitialized()
    var
        CompanyInfo: Record "Company Information";
    begin
        CompanyInfo.Get();
        CompanyInfo."VAT Registration No." := 'TEST-DATA-INIT';
        CompanyInfo.Modify();
    end;
}