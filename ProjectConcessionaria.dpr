program ProjectConcessionaria;

uses
  Vcl.Forms,
  Unitlogin in 'Unitlogin.pas' {Frmlogin},
  UnitDM in 'UnitDM.pas' {DM: TDataModule},
  UnitPrincipal in 'UnitPrincipal.pas' {frmprincipal},
  UnitCliMan in 'UnitCliMan.pas' {frmcliman},
  UnitCliCad in 'UnitCliCad.pas' {frmclicad},
  UnitCargoMan in 'UnitCargoMan.pas' {frmcargoman},
  UnitCargoCad in 'UnitCargoCad.pas' {frmcargocad},
  UnitFornCad in 'UnitFornCad.pas' {frmforncad},
  UnitDptoMan in 'UnitDptoMan.pas' {frmdptoman},
  UnitDeptoCad in 'UnitDeptoCad.pas' {frmdptocad},
  UnitVeiculosCad in 'UnitVeiculosCad.pas' {FrmVeicCad},
  UnitVeicMan in 'UnitVeicMan.pas' {FrmVeicMan},
  UnitOfiCad in 'UnitOfiCad.pas' {Frmoficad},
  UnitOficiman in 'UnitOficiman.pas' {FrmOfiMan},
  UnitCadFunc in 'UnitCadFunc.pas' {FrmFunc},
  Unitvendascad in 'Unitvendascad.pas' {frmvendas},
  UnitCliRel in 'UnitCliRel.pas' {FrmRelCli},
  UnitRelVeic in 'UnitRelVeic.pas' {FrmRelVeic},
  UnitRelFuncionarios in 'UnitRelFuncionarios.pas' {frmrelfunc},
  UnitRelDepartamentos in 'UnitRelDepartamentos.pas' {frmreldep},
  UnitRelVeicMaster in 'UnitRelVeicMaster.pas' {FrmRelVeicMaster},
  UnitRelFornecedor in 'UnitRelFornecedor.pas' {frmrelfornecedor},
  Unitrelcargos in 'Unitrelcargos.pas' {frmrelcargos},
  UnitUsuarios in 'UnitUsuarios.pas' {frmusuario},
  UnitUsuariosMan in 'UnitUsuariosMan.pas' {frmusuman},
  UnitRelUusaios in 'UnitRelUusaios.pas' {frmrelusuarios},
  UnitRelOficina in 'UnitRelOficina.pas' {FrmRelOficina},
  UnitFornMan in 'UnitFornMan.pas' {frmfornman},
  UnitFuncMan in 'UnitFuncMan.pas' {FrmFuncMan},
  UnitRelFuncCargo in 'UnitRelFuncCargo.pas' {frmrelfuncargo},
  UnitRelManut in 'UnitRelManut.pas' {ftmrelmanut},
  UnitManuCad in 'UnitManuCad.pas' {FrmManu},
  UnitManuMan in 'UnitManuMan.pas' {FrmManuMan},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Amakrits');
  Application.CreateForm(TFrmlogin, Frmlogin);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrmcliman, frmcliman);
  Application.CreateForm(Tfrmclicad, frmclicad);
  Application.CreateForm(Tfrmcargoman, frmcargoman);
  Application.CreateForm(Tfrmcargocad, frmcargocad);
  Application.CreateForm(Tfrmforncad, frmforncad);
  Application.CreateForm(Tfrmdptoman, frmdptoman);
  Application.CreateForm(Tfrmdptocad, frmdptocad);
  Application.CreateForm(TFrmVeicCad, FrmVeicCad);
  Application.CreateForm(TFrmVeicMan, FrmVeicMan);
  Application.CreateForm(TFrmoficad, Frmoficad);
  Application.CreateForm(TFrmOfiMan, FrmOfiMan);
  Application.CreateForm(TFrmFunc, FrmFunc);
  Application.CreateForm(Tfrmvendas, frmvendas);
  Application.CreateForm(TFrmRelCli, FrmRelCli);
  Application.CreateForm(TFrmRelVeic, FrmRelVeic);
  Application.CreateForm(Tfrmrelfunc, frmrelfunc);
  Application.CreateForm(Tfrmreldep, frmreldep);
  Application.CreateForm(TFrmRelVeic, FrmRelVeic);
  Application.CreateForm(TFrmRelVeicMaster, FrmRelVeicMaster);
  Application.CreateForm(Tfrmrelfornecedor, frmrelfornecedor);
  Application.CreateForm(Tfrmrelcargos, frmrelcargos);
  Application.CreateForm(Tfrmusuario, frmusuario);
  Application.CreateForm(Tfrmusuman, frmusuman);
  Application.CreateForm(Tfrmrelusuarios, frmrelusuarios);
  Application.CreateForm(TFrmRelOficina, FrmRelOficina);
  Application.CreateForm(Tfrmrelfuncargo, frmrelfuncargo);
  Application.CreateForm(TFrmManu, FrmManu);
  Application.CreateForm(TFrmManuMan, FrmManuMan);
  Application.CreateForm(Tfrmfornman, frmfornman);
  Application.CreateForm(TFrmFuncMan, FrmFuncMan);
  Application.CreateForm(Tfrmrelfuncargo, frmrelfuncargo);
  Application.CreateForm(TFrmManu, FrmManu);
  Application.CreateForm(TFrmManuMan, FrmManuMan);
  Application.CreateForm(Tftmrelmanut, ftmrelmanut);
  Application.CreateForm(TFrmManu, FrmManu);
  Application.CreateForm(TFrmManuMan, FrmManuMan);
  Application.Run;
end.
