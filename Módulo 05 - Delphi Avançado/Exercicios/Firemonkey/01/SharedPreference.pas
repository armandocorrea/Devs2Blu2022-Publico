unit SharedPreference;

interface

{$IF Defined(ANDROID)}

uses
  AndroidApi.Jni.JavaTypes,
  AndroidApi.Helpers,
  AndroidApi.Jni.App,
  AndroidApi.JNIBridge,
  AndroidApi.Jni.GraphicsContentViewText,
  FMX.Helpers.Android;
{$ENDIF}
{$IF Defined(IOS)}

uses
  Macapi.Helpers,
  Macapi.ObjectiveC,
  Macapi.CoreFoundation,
  Macapi.Dispatch,
  iOSApi.CocoaTypes,
  iOSApi.Foundation,
  Posix.SysSocket;
{$ENDIF}

procedure SetPropertiesDispositivo(Properties, Value: string);
function GetPropertiesDispositivo(Properties: string): string;

implementation

procedure SetPropertiesDispositivo(Properties, Value: string);
{$IF Defined(ANDROID)}
var
  Prefs: JSharedPreferences;
  Editor: JSharedPreferences_Editor;
{$ENDIF}
{$IF Defined(IOS)}
var
  lDefaults: NSUserDefaults;
{$ENDIF}
begin
{$IF Defined(ANDROID)}
  Prefs := TAndroidHelper.Activity.getPreferences(0);
  Editor := Prefs.edit;
  Editor.putString(StringToJString(Properties), StringToJString(Value));
  Editor.apply;
{$ENDIF}
{$IF Defined(IOS)}
  lDefaults := TNSUserDefaults.Wrap
    (TNSUserDefaults.OCClass.standardUserDefaults);
  lDefaults.setObject((NSStr(Value) as ILocalObject).GetObjectID,
    NSStr(Properties));

{$ENDIF}
end;

function GetPropertiesDispositivo(Properties: string): string;
var
  l: boolean;
{$IF DEFINED (ANDROID)}
  Prefs: JSharedPreferences;
  Editor: JSharedPreferences_Editor;
{$ENDIF}
{$IF DEFINED (IOS)}
  lDefaults: NSUserDefaults;
  lDict: NSMutableDictionary;
{$ENDIF}
begin
{$IF DEFINED (ANDROID)}
  Prefs := TAndroidHelper.Activity.getPreferences(0);
  result := JStringToString(Prefs.getString(StringToJString(Properties),
    StringToJString('')));
{$ENDIF}
{$IF DEFINED (IOS)}
  lDefaults := TNSUserDefaults.Wrap
    (TNSUserDefaults.OCClass.standardUserDefaults);
  result := NSStrToStr(lDefaults.stringForKey(NSStr(Properties)));
{$ENDIF}
end;

end.
