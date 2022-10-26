import Flutter
import UIKit

public class SwiftFlkvPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    
  }

  public static func forbiddenToCall() {
    wire_open(0, nil, false)
    wire_close(0, nil)
    wire_get_rows(0, nil)
    wire_get(0, nil, nil)
    wire_put(0, nil, nil, nil)
    wire_delete(0, nil, nil)
    new_uint_8_list_0(0)
    free_WireSyncReturnStruct(WireSyncReturnStruct())
    store_dart_post_cobject(nil)
  }
}
