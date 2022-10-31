import Flutter
import UIKit

public class SwiftFlkvPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    
  }

  public static func forbiddenToCall() {
    wire_db_new(0, nil)
    wire_db_close(0, 0)
    wire_db_flush(0, 0);
    wire_db_get_rows(0, 0)
    wire_db_get(0, 0, nil)
    wire_db_put(0, 0, nil, nil)
    wire_db_delete(0, 0, nil)
    new_uint_8_list_0(0)
    free_WireSyncReturnStruct(WireSyncReturnStruct())
    store_dart_post_cobject(nil)
  }
}
