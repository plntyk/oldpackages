--- a/MessageBase.h
+++ b/MessageBase.h
@@ -27,6 +27,8 @@
 #ifndef MESSAGEBASE_H
 #define MESSAGEBASE_H
 
+#include <sys/types.h>
+
 static const int32_t NZBMESSAGE_SIGNATURE = 0x6E7A620A; // = "nzbA" (protocol version)
 static const int NZBREQUESTFILENAMESIZE = 512;
 static const int NZBREQUESTPASSWORDSIZE = 32;
