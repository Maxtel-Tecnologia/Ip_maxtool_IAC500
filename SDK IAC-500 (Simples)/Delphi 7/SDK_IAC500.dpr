program SDK_IAC500;

uses
  Forms,
  Unit_Principal in 'Unit_Principal.pas' {Principal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPrincipal, Principal);
  Application.Run;
end.
