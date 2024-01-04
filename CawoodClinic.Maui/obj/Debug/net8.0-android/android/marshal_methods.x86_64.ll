; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [382 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [764 x i64] [
	i64 24362543149721218, ; 0: Xamarin.AndroidX.DynamicAnimation => 0x568d9a9a43a682 => 278
	i64 98382396393917666, ; 1: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 220
	i64 120698629574877762, ; 2: Mono.Android => 0x1accec39cafe242 => 171
	i64 131669012237370309, ; 3: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 229
	i64 196720943101637631, ; 4: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 58
	i64 210515253464952879, ; 5: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 265
	i64 229794953483747371, ; 6: System.ValueTuple.dll => 0x330654aed93802b => 151
	i64 232391251801502327, ; 7: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 306
	i64 295915112840604065, ; 8: Xamarin.AndroidX.SlidingPaneLayout => 0x41b4d3a3088a9a1 => 309
	i64 316157742385208084, ; 9: Xamarin.AndroidX.Core.Core.Ktx.dll => 0x46337caa7dc1b14 => 272
	i64 350667413455104241, ; 10: System.ServiceProcess.dll => 0x4ddd227954be8f1 => 132
	i64 422779754995088667, ; 11: System.IO.UnmanagedMemoryStream => 0x5de03f27ab57d1b => 56
	i64 435118502366263740, ; 12: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x609d9f8f8bdb9bc => 308
	i64 535107122908063503, ; 13: Microsoft.Extensions.ObjectPool.dll => 0x76d1517d9b7670f => 218
	i64 536549396266126416, ; 14: DevExpress.Printing.v23.2.Core => 0x77234d548e48c50 => 197
	i64 558811379087732614, ; 15: DXEditors.a.dll => 0x7c14bfd12f86f86 => 183
	i64 560278790331054453, ; 16: System.Reflection.Primitives => 0x7c6829760de3975 => 95
	i64 570522211579385009, ; 17: Serilog.dll => 0x7eae6edbda8d4b1 => 233
	i64 598946427227332230, ; 18: pl\System.Private.ServiceModel.resources => 0x84fe29a2a5fde86 => 374
	i64 602358440769925478, ; 19: DevExpress.Maui.Scheduler => 0x85c01cf798cb166 => 193
	i64 634308326490598313, ; 20: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x8cd840fee8b6ba9 => 291
	i64 649145001856603771, ; 21: System.Security.SecureString => 0x90239f09b62167b => 129
	i64 702024105029695270, ; 22: System.Drawing.Common => 0x9be17343c0e7726 => 240
	i64 727816129158616361, ; 23: DevExpress.Data.v23.2 => 0xa19b8e9d04c9529 => 176
	i64 750875890346172408, ; 24: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 145
	i64 798450721097591769, ; 25: Xamarin.AndroidX.Collection.Ktx.dll => 0xb14aab351ad2bd9 => 266
	i64 799765834175365804, ; 26: System.ComponentModel.dll => 0xb1956c9f18442ac => 18
	i64 805302231655005164, ; 27: hu\Microsoft.Maui.Controls.resources.dll => 0xb2d021ceea03bec => 345
	i64 870603111519317375, ; 28: SQLitePCLRaw.lib.e_sqlite3.android => 0xc1500ead2756d7f => 238
	i64 872800313462103108, ; 29: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 277
	i64 895210737996778430, ; 30: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0xc6c6d6c5569cbbe => 292
	i64 940822596282819491, ; 31: System.Transactions => 0xd0e792aa81923a3 => 150
	i64 960778385402502048, ; 32: System.Runtime.Handles.dll => 0xd555ed9e1ca1ba0 => 104
	i64 1010599046655515943, ; 33: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 95
	i64 1120440138749646132, ; 34: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 321
	i64 1244917166771784164, ; 35: DevExpress.Maui.Editors => 0x1146d5913c37c9e4 => 191
	i64 1268860745194512059, ; 36: System.Drawing.dll => 0x119be62002c19ebb => 36
	i64 1301485588176585670, ; 37: SQLitePCLRaw.core => 0x120fce3f338e43c6 => 237
	i64 1301626418029409250, ; 38: System.Diagnostics.FileVersionInfo => 0x12104e54b4e833e2 => 28
	i64 1315114680217950157, ; 39: Xamarin.AndroidX.Arch.Core.Common.dll => 0x124039d5794ad7cd => 260
	i64 1348139812537487829, ; 40: DXEditors.a => 0x12b58e0449dbd1d5 => 183
	i64 1369545283391376210, ; 41: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 299
	i64 1404195534211153682, ; 42: System.IO.FileSystem.Watcher.dll => 0x137cb4660bd87f12 => 50
	i64 1425944114962822056, ; 43: System.Runtime.Serialization.dll => 0x13c9f89e19eaf3a8 => 115
	i64 1476839205573959279, ; 44: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 70
	i64 1486715745332614827, ; 45: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 226
	i64 1492954217099365037, ; 46: System.Net.HttpListener => 0x14b809f350210aad => 65
	i64 1513467482682125403, ; 47: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 170
	i64 1518315023656898250, ; 48: SQLitePCLRaw.provider.e_sqlite3 => 0x151223783a354eca => 239
	i64 1537168428375924959, ; 49: System.Threading.Thread.dll => 0x15551e8a954ae0df => 145
	i64 1576750169145655260, ; 50: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x15e1bdecc376bfdc => 320
	i64 1624659445732251991, ; 51: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 259
	i64 1628611045998245443, ; 52: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 295
	i64 1636321030536304333, ; 53: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0x16b5614ec39e16cd => 285
	i64 1651782184287836205, ; 54: System.Globalization.Calendars => 0x16ec4f2524cb982d => 40
	i64 1659332977923810219, ; 55: System.Reflection.DispatchProxy => 0x1707228d493d63ab => 89
	i64 1672383392659050004, ; 56: Microsoft.Data.Sqlite.dll => 0x17357fd5bfb48e14 => 203
	i64 1682513316613008342, ; 57: System.Net.dll => 0x17597cf276952bd6 => 81
	i64 1735388228521408345, ; 58: System.Net.Mail.dll => 0x181556663c69b759 => 66
	i64 1742173776940291998, ; 59: DevExpress.Pdf.v23.2.Drawing => 0x182d71d1d786d79e => 196
	i64 1743969030606105336, ; 60: System.Memory.dll => 0x1833d297e88f2af8 => 62
	i64 1767386781656293639, ; 61: System.Private.Uri.dll => 0x188704e9f5582107 => 86
	i64 1795316252682057001, ; 62: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 258
	i64 1825687700144851180, ; 63: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 106
	i64 1835311033149317475, ; 64: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 339
	i64 1836611346387731153, ; 65: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 306
	i64 1854145951182283680, ; 66: System.Runtime.CompilerServices.VisualC => 0x19bb3feb3df2e3a0 => 102
	i64 1865037103900624886, ; 67: Microsoft.Bcl.AsyncInterfaces => 0x19e1f15d56eb87f6 => 202
	i64 1875417405349196092, ; 68: System.Drawing.Primitives => 0x1a06d2319b6c713c => 35
	i64 1875917498431009007, ; 69: Xamarin.AndroidX.Annotation.dll => 0x1a08990699eb70ef => 255
	i64 1881198190668717030, ; 70: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 361
	i64 1887344313179053137, ; 71: DXCharts.a => 0x1a3131a73be41c51 => 179
	i64 1897575647115118287, ; 72: Xamarin.AndroidX.Security.SecurityCrypto => 0x1a558aff4cba86cf => 308
	i64 1918852405404808846, ; 73: Xamarin.AndroidX.AutoFill.dll => 0x1aa12218a08eb68e => 262
	i64 1920760634179481754, ; 74: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 227
	i64 1930726298510463061, ; 75: CommunityToolkit.Mvvm.dll => 0x1acb5156cd389055 => 175
	i64 1972385128188460614, ; 76: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 119
	i64 1981742497975770890, ; 77: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 293
	i64 2040001226662520565, ; 78: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 142
	i64 2062890601515140263, ; 79: System.Threading.Tasks.Dataflow => 0x1ca0dc1289cd44a7 => 141
	i64 2064708342624596306, ; 80: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x1ca7514c5eecb152 => 329
	i64 2080945842184875448, ; 81: System.IO.MemoryMappedFiles => 0x1ce10137d8416db8 => 53
	i64 2102659300918482391, ; 82: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 35
	i64 2106033277907880740, ; 83: System.Threading.Tasks.Dataflow.dll => 0x1d3a221ba6d9cb24 => 141
	i64 2165310824878145998, ; 84: Xamarin.Android.Glide.GifDecoder => 0x1e0cbab9112b81ce => 252
	i64 2165725771938924357, ; 85: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 263
	i64 2188974421706709258, ; 86: SkiaSharp.HarfBuzz.dll => 0x1e60cca38c3e990a => 235
	i64 2192948757939169934, ; 87: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x1e6eeb46cf992a8e => 205
	i64 2200176636225660136, ; 88: Microsoft.Extensions.Logging.Debug.dll => 0x1e8898fe5d5824e8 => 217
	i64 2210058262765462106, ; 89: DevExpress.Maui.Controls => 0x1eabb447d50d625a => 185
	i64 2262844636196693701, ; 90: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 277
	i64 2287834202362508563, ; 91: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 8
	i64 2287887973817120656, ; 92: System.ComponentModel.DataAnnotations.dll => 0x1fc035fd8d41f790 => 14
	i64 2304837677853103545, ; 93: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0x1ffc6da80d5ed5b9 => 305
	i64 2315304989185124968, ; 94: System.IO.FileSystem.dll => 0x20219d9ee311aa68 => 51
	i64 2329709569556905518, ; 95: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 288
	i64 2335503487726329082, ; 96: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 136
	i64 2337758774805907496, ; 97: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 101
	i64 2470498323731680442, ; 98: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 270
	i64 2473092425853538470, ; 99: ko\System.Private.ServiceModel.resources.dll => 0x2252307553b590a6 => 373
	i64 2479423007379663237, ; 100: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x2268ae16b2cba985 => 315
	i64 2497223385847772520, ; 101: System.Runtime => 0x22a7eb7046413568 => 116
	i64 2547086958574651984, ; 102: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 253
	i64 2592350477072141967, ; 103: System.Xml.dll => 0x23f9e10627330e8f => 163
	i64 2602673633151553063, ; 104: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 360
	i64 2612152650457191105, ; 105: Microsoft.IdentityModel.Tokens.dll => 0x24403afeed9892c1 => 224
	i64 2624866290265602282, ; 106: mscorlib.dll => 0x246d65fbde2db8ea => 166
	i64 2632269733008246987, ; 107: System.Net.NameResolution => 0x2487b36034f808cb => 67
	i64 2656907746661064104, ; 108: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 212
	i64 2662981627730767622, ; 109: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 335
	i64 2699342487583673876, ; 110: ru\System.Private.ServiceModel.resources => 0x2575fdb0d38b4e14 => 376
	i64 2706075432581334785, ; 111: System.Net.WebSockets => 0x258de944be6c0701 => 80
	i64 2739068961103071885, ; 112: ko\System.Private.ServiceModel.resources => 0x260320b539d8ca8d => 373
	i64 2783046991838674048, ; 113: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 101
	i64 2787234703088983483, ; 114: Xamarin.AndroidX.Startup.StartupRuntime => 0x26ae3f31ef429dbb => 310
	i64 2789714023057451704, ; 115: Microsoft.IdentityModel.JsonWebTokens.dll => 0x26b70e1f9943eab8 => 222
	i64 2815524396660695947, ; 116: System.Security.AccessControl => 0x2712c0857f68238b => 117
	i64 2870618300109509804, ; 117: DXCollectionView.a => 0x27d67c227fc354ac => 181
	i64 2895129759130297543, ; 118: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 340
	i64 2923871038697555247, ; 119: Jsr305Binding => 0x2893ad37e69ec52f => 322
	i64 3017136373564924869, ; 120: System.Net.WebProxy => 0x29df058bd93f63c5 => 78
	i64 3017704767998173186, ; 121: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 321
	i64 3106852385031680087, ; 122: System.Runtime.Serialization.Xml => 0x2b1dc1c88b637057 => 114
	i64 3110390492489056344, ; 123: System.Security.Cryptography.Csp.dll => 0x2b2a53ac61900058 => 121
	i64 3135773902340015556, ; 124: System.IO.FileSystem.DriveInfo.dll => 0x2b8481c008eac5c4 => 48
	i64 3199888167950708788, ; 125: it\System.Private.ServiceModel.resources.dll => 0x2c684955c3ad7034 => 371
	i64 3238539556702659506, ; 126: Microsoft.Win32.SystemEvents.dll => 0x2cf19a917c5023b2 => 231
	i64 3244151229865893572, ; 127: pt-BR\System.Private.ServiceModel.resources => 0x2d058a5af5cd9ec4 => 375
	i64 3254355948039184634, ; 128: DevExpress.Office.v23.2.Core => 0x2d29cb7e0f8e20fa => 194
	i64 3281594302220646930, ; 129: System.Security.Principal => 0x2d8a90a198ceba12 => 128
	i64 3289520064315143713, ; 130: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 286
	i64 3303437397778967116, ; 131: Xamarin.AndroidX.Annotation.Experimental => 0x2dd82acf985b2a4c => 256
	i64 3311221304742556517, ; 132: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 82
	i64 3325875462027654285, ; 133: System.Runtime.Numerics => 0x2e27e21c8958b48d => 110
	i64 3328853167529574890, ; 134: System.Net.Sockets.dll => 0x2e327651a008c1ea => 75
	i64 3344514922410554693, ; 135: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 332
	i64 3355395775298280038, ; 136: Xamarin.AndroidX.AutoFill => 0x2e90c2ae13801a66 => 262
	i64 3402534845034375023, ; 137: System.IdentityModel.Tokens.Jwt.dll => 0x2f383b6a0629a76f => 241
	i64 3402559797031278872, ; 138: zh-Hant\System.Private.ServiceModel.resources => 0x2f38521b9d131918 => 379
	i64 3429672777697402584, ; 139: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 229
	i64 3437845325506641314, ; 140: System.IO.MemoryMappedFiles.dll => 0x2fb5ae1beb8f7da2 => 53
	i64 3461602852075779363, ; 141: SkiaSharp.HarfBuzz => 0x300a15741f74b523 => 235
	i64 3493805808809882663, ; 142: Xamarin.AndroidX.Tracing.Tracing.dll => 0x307c7ddf444f3427 => 312
	i64 3494946837667399002, ; 143: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 210
	i64 3508450208084372758, ; 144: System.Net.Ping => 0x30b084e02d03ad16 => 69
	i64 3522470458906976663, ; 145: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 311
	i64 3523004241079211829, ; 146: Microsoft.Extensions.Caching.Memory.dll => 0x30e439b10bb89735 => 209
	i64 3531994851595924923, ; 147: System.Numerics => 0x31042a9aade235bb => 83
	i64 3551103847008531295, ; 148: System.Private.CoreLib.dll => 0x31480e226177735f => 172
	i64 3567343442040498961, ; 149: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 355
	i64 3571415421602489686, ; 150: System.Runtime.dll => 0x319037675df7e556 => 116
	i64 3598999950994153531, ; 151: CawoodClinic.Maui.dll => 0x31f2376319a7a03b => 0
	i64 3634544395678783861, ; 152: System.ServiceModel => 0x32707edf08d21975 => 248
	i64 3638003163729360188, ; 153: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 211
	i64 3647754201059316852, ; 154: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 156
	i64 3655542548057982301, ; 155: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 210
	i64 3659371656528649588, ; 156: Xamarin.Android.Glide.Annotations => 0x32c8b3222885dd74 => 250
	i64 3716579019761409177, ; 157: netstandard.dll => 0x3393f0ed5c8c5c99 => 167
	i64 3727469159507183293, ; 158: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 304
	i64 3772598417116884899, ; 159: Xamarin.AndroidX.DynamicAnimation.dll => 0x345af645b473efa3 => 278
	i64 3869221888984012293, ; 160: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 215
	i64 3869649043256705283, ; 161: System.Diagnostics.Tools => 0x35b3c14d74bf0103 => 32
	i64 3890352374528606784, ; 162: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 227
	i64 3919223565570527920, ; 163: System.Security.Cryptography.Encoding => 0x3663e111652bd2b0 => 122
	i64 3933965368022646939, ; 164: System.Net.Requests => 0x369840a8bfadc09b => 72
	i64 3966267475168208030, ; 165: System.Memory => 0x370b03412596249e => 62
	i64 4006972109285359177, ; 166: System.Xml.XmlDocument => 0x379b9fe74ed9fe49 => 161
	i64 4009997192427317104, ; 167: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 113
	i64 4070326265757318011, ; 168: da\Microsoft.Maui.Controls.resources.dll => 0x387cb42c56683b7b => 336
	i64 4073500526318903918, ; 169: System.Private.Xml.dll => 0x3887fb25779ae26e => 88
	i64 4073631083018132676, ; 170: Microsoft.Maui.Controls.Compatibility.dll => 0x388871e311491cc4 => 225
	i64 4120493066591692148, ; 171: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 366
	i64 4127427327551562508, ; 172: DevExpress.Maui.Core => 0x394791494ef3630c => 187
	i64 4148881117810174540, ; 173: System.Runtime.InteropServices.JavaScript.dll => 0x3993c9651a66aa4c => 105
	i64 4154383907710350974, ; 174: System.ComponentModel => 0x39a7562737acb67e => 18
	i64 4167269041631776580, ; 175: System.Threading.ThreadPool => 0x39d51d1d3df1cf44 => 146
	i64 4168469861834746866, ; 176: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 118
	i64 4187479170553454871, ; 177: System.Linq.Expressions => 0x3a1cea1e912fa117 => 58
	i64 4201423742386704971, ; 178: Xamarin.AndroidX.Core.Core.Ktx => 0x3a4e74a233da124b => 272
	i64 4205801962323029395, ; 179: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 17
	i64 4235503420553921860, ; 180: System.IO.IsolatedStorage.dll => 0x3ac787eb9b118544 => 52
	i64 4282138915307457788, ; 181: System.Reflection.Emit => 0x3b6d36a7ddc70cfc => 92
	i64 4337444564132831293, ; 182: SQLitePCLRaw.batteries_v2.dll => 0x3c31b2d9ae16203d => 236
	i64 4360412976914417659, ; 183: tr\Microsoft.Maui.Controls.resources.dll => 0x3c834c8002fcc7fb => 361
	i64 4367142137090651694, ; 184: DXCore.a.dll => 0x3c9b34a2b4edb62e => 186
	i64 4373617458794931033, ; 185: System.IO.Pipes.dll => 0x3cb235e806eb2359 => 55
	i64 4384334752651165692, ; 186: DevExpress.Maui.CollectionView.dll => 0x3cd8493a742c3ffc => 182
	i64 4397634830160618470, ; 187: System.Security.SecureString.dll => 0x3d0789940f9be3e6 => 129
	i64 4401076402506455931, ; 188: DXGrid.a => 0x3d13c3ab90c05b7b => 188
	i64 4477672992252076438, ; 189: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 152
	i64 4484706122338676047, ; 190: System.Globalization.Extensions.dll => 0x3e3ce07510042d4f => 41
	i64 4513320955448359355, ; 191: Microsoft.EntityFrameworkCore.Relational => 0x3ea2897f12d379bb => 206
	i64 4533124835995628778, ; 192: System.Reflection.Emit.dll => 0x3ee8e505540534ea => 92
	i64 4612482779465751747, ; 193: Microsoft.EntityFrameworkCore.Abstractions => 0x4002d4a662a99cc3 => 205
	i64 4636684751163556186, ; 194: Xamarin.AndroidX.VersionedParcelable.dll => 0x4058d0370893015a => 316
	i64 4648976354129798698, ; 195: DXScheduler.a.dll => 0x40847b5cdd18e62a => 192
	i64 4672453897036726049, ; 196: System.IO.FileSystem.Watcher => 0x40d7e4104a437f21 => 50
	i64 4700541480210687053, ; 197: DevExpress.Maui.DataGrid.Export.dll => 0x413bad925bf2644d => 190
	i64 4716677666592453464, ; 198: System.Xml.XmlSerializer => 0x417501590542f358 => 162
	i64 4743181914488341673, ; 199: DevExpress.Maui.Charts => 0x41d32ad21e2284a9 => 180
	i64 4743821336939966868, ; 200: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 13
	i64 4759461199762736555, ; 201: Xamarin.AndroidX.Lifecycle.Process.dll => 0x420d00be961cc5ab => 290
	i64 4794310189461587505, ; 202: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 253
	i64 4795410492532947900, ; 203: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 311
	i64 4809057822547766521, ; 204: System.Drawing => 0x42bd349c3145ecf9 => 36
	i64 4814660307502931973, ; 205: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 67
	i64 4853321196694829351, ; 206: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 109
	i64 4871824391508510238, ; 207: nb\Microsoft.Maui.Controls.resources.dll => 0x439c3278d7f2c61e => 351
	i64 4953714692329509532, ; 208: sv\Microsoft.Maui.Controls.resources.dll => 0x44bf21444aef129c => 359
	i64 5000172366916202135, ; 209: OneOf => 0x45642e4691c3ae97 => 232
	i64 5035626850155018993, ; 210: CawoodClinic.Maui => 0x45e223f0b8e8baf1 => 0
	i64 5055365687667823624, ; 211: Xamarin.AndroidX.Activity.Ktx.dll => 0x4628444ef7239408 => 254
	i64 5081566143765835342, ; 212: System.Resources.ResourceManager.dll => 0x4685597c05d06e4e => 99
	i64 5099468265966638712, ; 213: System.Resources.ResourceManager => 0x46c4f35ea8519678 => 99
	i64 5103417709280584325, ; 214: System.Collections.Specialized => 0x46d2fb5e161b6285 => 11
	i64 5129462924058778861, ; 215: Microsoft.Data.Sqlite => 0x472f835a350f5ced => 203
	i64 5182934613077526976, ; 216: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 11
	i64 5205316157927637098, ; 217: Xamarin.AndroidX.LocalBroadcastManager => 0x483cff7778e0c06a => 297
	i64 5224389836070300593, ; 218: CawoodClinic.Shared => 0x4880c2e03b21abb1 => 380
	i64 5244375036463807528, ; 219: System.Diagnostics.Contracts.dll => 0x48c7c34f4d59fc28 => 25
	i64 5262971552273843408, ; 220: System.Security.Principal.dll => 0x4909d4be0c44c4d0 => 128
	i64 5278787618751394462, ; 221: System.Net.WebClient.dll => 0x4942055efc68329e => 76
	i64 5280980186044710147, ; 222: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x4949cf7fd7123d03 => 289
	i64 5290786973231294105, ; 223: System.Runtime.Loader => 0x496ca6b869b72699 => 109
	i64 5315518132212402925, ; 224: de\System.Private.ServiceModel.resources.dll => 0x49c4839413ab0aed => 368
	i64 5376510917114486089, ; 225: Xamarin.AndroidX.VectorDrawable.Animated => 0x4a9d3431719e5d49 => 315
	i64 5408338804355907810, ; 226: Xamarin.AndroidX.Transition => 0x4b0e477cea9840e2 => 313
	i64 5423376490970181369, ; 227: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 106
	i64 5440320908473006344, ; 228: Microsoft.VisualBasic.Core => 0x4b7fe70acda9f908 => 2
	i64 5446034149219586269, ; 229: System.Diagnostics.Debug => 0x4b94333452e150dd => 26
	i64 5451019430259338467, ; 230: Xamarin.AndroidX.ConstraintLayout.dll => 0x4ba5e94a845c2ce3 => 268
	i64 5457765010617926378, ; 231: System.Xml.Serialization => 0x4bbde05c557002ea => 157
	i64 5459411578015390000, ; 232: DevExpress.Drawing.v23.2.dll => 0x4bc3b9e7ae431930 => 177
	i64 5471532531798518949, ; 233: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 359
	i64 5507995362134886206, ; 234: System.Core.dll => 0x4c705499688c873e => 21
	i64 5522859530602327440, ; 235: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 362
	i64 5527431512186326818, ; 236: System.IO.FileSystem.Primitives.dll => 0x4cb561acbc2a8f22 => 49
	i64 5570799893513421663, ; 237: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 43
	i64 5573260873512690141, ; 238: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 126
	i64 5574231584441077149, ; 239: Xamarin.AndroidX.Annotation.Jvm => 0x4d5ba617ae5f8d9d => 257
	i64 5591791169662171124, ; 240: System.Linq.Parallel => 0x4d9a087135e137f4 => 59
	i64 5650097808083101034, ; 241: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 119
	i64 5692067934154308417, ; 242: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 318
	i64 5724799082821825042, ; 243: Xamarin.AndroidX.ExifInterface => 0x4f72926f3e13b212 => 281
	i64 5757522595884336624, ; 244: Xamarin.AndroidX.Concurrent.Futures.dll => 0x4fe6d44bd9f885f0 => 267
	i64 5783556987928984683, ; 245: Microsoft.VisualBasic => 0x504352701bbc3c6b => 3
	i64 5896680224035167651, ; 246: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x51d5376bfbafdda3 => 287
	i64 5959344983920014087, ; 247: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x52b3d8b05c8ef307 => 307
	i64 5979151488806146654, ; 248: System.Formats.Asn1 => 0x52fa3699a489d25e => 38
	i64 5984759512290286505, ; 249: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 124
	i64 6102788177522843259, ; 250: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0x54b1758374b3de7b => 307
	i64 6183170893902868313, ; 251: SQLitePCLRaw.batteries_v2 => 0x55cf092b0c9d6f59 => 236
	i64 6200764641006662125, ; 252: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 356
	i64 6222399776351216807, ; 253: System.Text.Json.dll => 0x565a67a0ffe264a7 => 137
	i64 6251069312384999852, ; 254: System.Transactions.Local => 0x56c0426b870da1ac => 149
	i64 6278736998281604212, ; 255: System.Private.DataContractSerialization => 0x57228e08a4ad6c74 => 85
	i64 6284145129771520194, ; 256: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 90
	i64 6300676701234028427, ; 257: es\Microsoft.Maui.Controls.resources.dll => 0x57708013cda25f8b => 339
	i64 6319713645133255417, ; 258: Xamarin.AndroidX.Lifecycle.Runtime => 0x57b42213b45b52f9 => 291
	i64 6357457916754632952, ; 259: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 381
	i64 6401687960814735282, ; 260: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 288
	i64 6471714727257221498, ; 261: fi\Microsoft.Maui.Controls.resources.dll => 0x59d026417dd4a97a => 340
	i64 6478287442656530074, ; 262: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 344
	i64 6504860066809920875, ; 263: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 263
	i64 6548213210057960872, ; 264: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 274
	i64 6557084851308642443, ; 265: Xamarin.AndroidX.Window.dll => 0x5aff71ee6c58c08b => 319
	i64 6560151584539558821, ; 266: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 219
	i64 6589202984700901502, ; 267: Xamarin.Google.ErrorProne.Annotations.dll => 0x5b718d34180a787e => 324
	i64 6591971792923354531, ; 268: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x5b7b636b7e9765a3 => 289
	i64 6593221254138628694, ; 269: DevExpress.RichEdit.v23.2.Export => 0x5b7fd3cc5a7d0a56 => 199
	i64 6617685658146568858, ; 270: System.Text.Encoding.CodePages => 0x5bd6be0b4905fa9a => 133
	i64 6671798237668743565, ; 271: SkiaSharp => 0x5c96fd260152998d => 234
	i64 6713440830605852118, ; 272: System.Reflection.TypeExtensions.dll => 0x5d2aeeddb8dd7dd6 => 96
	i64 6739853162153639747, ; 273: Microsoft.VisualBasic.dll => 0x5d88c4bde075ff43 => 3
	i64 6743165466166707109, ; 274: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 352
	i64 6772837112740759457, ; 275: System.Runtime.InteropServices.JavaScript => 0x5dfdf378527ec7a1 => 105
	i64 6786606130239981554, ; 276: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 33
	i64 6798329586179154312, ; 277: System.Windows => 0x5e5884bd523ca188 => 154
	i64 6814185388980153342, ; 278: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 158
	i64 6876862101832370452, ; 279: System.Xml.Linq => 0x5f6f85a57d108914 => 155
	i64 6894844156784520562, ; 280: System.Numerics.Vectors => 0x5faf683aead1ad72 => 82
	i64 6973631837866753851, ; 281: DevExpress.RichEdit.v23.2.Export.dll => 0x60c751356a66ff3b => 199
	i64 7011053663211085209, ; 282: Xamarin.AndroidX.Fragment.Ktx => 0x614c442918e5dd99 => 283
	i64 7033815339267038729, ; 283: tr\System.Private.ServiceModel.resources => 0x619d21c8c8b49e09 => 377
	i64 7045132749165778210, ; 284: DevExpress.Maui.Scheduler.dll => 0x61c556e89d7f5522 => 193
	i64 7060448593242414269, ; 285: System.Security.Cryptography.Xml => 0x61fbc096731edcbd => 245
	i64 7060896174307865760, ; 286: System.Threading.Tasks.Parallel.dll => 0x61fd57a90988f4a0 => 143
	i64 7083547580668757502, ; 287: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 87
	i64 7101497697220435230, ; 288: System.Configuration => 0x628d9687c0141d1e => 19
	i64 7103753931438454322, ; 289: Xamarin.AndroidX.Interpolator.dll => 0x62959a90372c7632 => 284
	i64 7105430439328552570, ; 290: System.Security.Cryptography.Pkcs => 0x629b8f56a06d167a => 244
	i64 7112547816752919026, ; 291: System.IO.FileSystem => 0x62b4d88e3189b1f2 => 51
	i64 7142976273706224655, ; 292: DXNavigation.a.dll => 0x6320f313694d8c0f => 184
	i64 7192745174564810625, ; 293: Xamarin.Android.Glide.GifDecoder.dll => 0x63d1c3a0a1d72f81 => 252
	i64 7229955455499660495, ; 294: DXCollectionView.a.dll => 0x6455f62e4af46ccf => 181
	i64 7270811800166795866, ; 295: System.Linq => 0x64e71ccf51a90a5a => 61
	i64 7299370801165188114, ; 296: System.IO.Pipes.AccessControl.dll => 0x654c9311e74f3c12 => 54
	i64 7305853726081136831, ; 297: cs\System.Private.ServiceModel.resources.dll => 0x65639b417c07b8bf => 367
	i64 7316205155833392065, ; 298: Microsoft.Win32.Primitives => 0x658861d38954abc1 => 4
	i64 7338192458477945005, ; 299: System.Reflection => 0x65d67f295d0740ad => 97
	i64 7349431895026339542, ; 300: Xamarin.Android.Glide.DiskLruCache => 0x65fe6d5e9bf88ed6 => 251
	i64 7377312882064240630, ; 301: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 17
	i64 7406532963531635641, ; 302: fr\System.Private.ServiceModel.resources.dll => 0x66c94a7d24863bb9 => 370
	i64 7488575175965059935, ; 303: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 155
	i64 7489048572193775167, ; 304: System.ObjectModel => 0x67ee71ff6b419e3f => 84
	i64 7496222613193209122, ; 305: System.IdentityModel.Tokens.Jwt => 0x6807eec000a1b522 => 241
	i64 7503526963013706253, ; 306: System.ServiceModel.dll => 0x6821e20478ff620d => 248
	i64 7592577537120840276, ; 307: System.Diagnostics.Process => 0x695e410af5b2aa54 => 29
	i64 7637303409920963731, ; 308: System.IO.Compression.ZipFile.dll => 0x69fd26fcb637f493 => 45
	i64 7654504624184590948, ; 309: System.Net.Http => 0x6a3a4366801b8264 => 64
	i64 7694700312542370399, ; 310: System.Net.Mail => 0x6ac9112a7e2cda5f => 66
	i64 7714652370974252055, ; 311: System.Private.CoreLib => 0x6b0ff375198b9c17 => 172
	i64 7725404731275645577, ; 312: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x6b3626ac11ce9289 => 292
	i64 7735176074855944702, ; 313: Microsoft.CSharp => 0x6b58dda848e391fe => 1
	i64 7735352534559001595, ; 314: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 327
	i64 7742555799473854801, ; 315: it\Microsoft.Maui.Controls.resources.dll => 0x6b73157a51479951 => 347
	i64 7789592736793255292, ; 316: DevExpress.Maui.Controls.dll => 0x6c1a3152b5865d7c => 185
	i64 7791074099216502080, ; 317: System.IO.FileSystem.AccessControl.dll => 0x6c1f749d468bcd40 => 47
	i64 7820441508502274321, ; 318: System.Data => 0x6c87ca1e14ff8111 => 24
	i64 7836164640616011524, ; 319: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 259
	i64 7972383140441761405, ; 320: Microsoft.Extensions.Caching.Abstractions.dll => 0x6ea3983a0b58267d => 208
	i64 7973320301220725699, ; 321: DevExpress.Drawing.v23.2.Skia.dll => 0x6ea6ec91caac03c3 => 178
	i64 7975724199463739455, ; 322: sk\Microsoft.Maui.Controls.resources.dll => 0x6eaf76e6f785e03f => 358
	i64 8000298072852794708, ; 323: DevExpress.Printing.v23.2.Core.dll => 0x6f06c4b5b9a20d54 => 197
	i64 8025517457475554965, ; 324: WindowsBase => 0x6f605d9b4786ce95 => 165
	i64 8031450141206250471, ; 325: System.Runtime.Intrinsics.dll => 0x6f757159d9dc03e7 => 108
	i64 8064050204834738623, ; 326: System.Collections.dll => 0x6fe942efa61731bf => 12
	i64 8083354569033831015, ; 327: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 286
	i64 8085230611270010360, ; 328: System.Net.Http.Json.dll => 0x703482674fdd05f8 => 63
	i64 8087206902342787202, ; 329: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 27
	i64 8103644804370223335, ; 330: System.Data.DataSetExtensions.dll => 0x7075ee03be6d50e7 => 23
	i64 8108129031893776750, ; 331: ko\Microsoft.Maui.Controls.resources.dll => 0x7085dc65530f796e => 349
	i64 8113615946733131500, ; 332: System.Reflection.Extensions => 0x70995ab73cf916ec => 93
	i64 8167236081217502503, ; 333: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 168
	i64 8185542183669246576, ; 334: System.Collections => 0x7198e33f4794aa70 => 12
	i64 8187640529827139739, ; 335: Xamarin.KotlinX.Coroutines.Android => 0x71a057ae90f0109b => 331
	i64 8246048515196606205, ; 336: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 230
	i64 8264926008854159966, ; 337: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 29
	i64 8290740647658429042, ; 338: System.Runtime.Extensions => 0x730ea0b15c929a72 => 103
	i64 8318905602908530212, ; 339: System.ComponentModel.DataAnnotations => 0x7372b092055ea624 => 14
	i64 8368701292315763008, ; 340: System.Security.Cryptography => 0x7423997c6fd56140 => 126
	i64 8386351099740279196, ; 341: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x74624de475b9d19c => 364
	i64 8398329775253868912, ; 342: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x748cdc6f3097d170 => 269
	i64 8400357532724379117, ; 343: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 301
	i64 8410671156615598628, ; 344: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 91
	i64 8426919725312979251, ; 345: Xamarin.AndroidX.Lifecycle.Process => 0x74f26ed7aa033133 => 290
	i64 8518412311883997971, ; 346: System.Collections.Immutable => 0x76377add7c28e313 => 9
	i64 8563666267364444763, ; 347: System.Private.Uri => 0x76d841191140ca5b => 86
	i64 8598790081731763592, ; 348: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x77550a055fc61d88 => 280
	i64 8599632406834268464, ; 349: CommunityToolkit.Maui => 0x7758081c784b4930 => 173
	i64 8601935802264776013, ; 350: Xamarin.AndroidX.Transition.dll => 0x7760370982b4ed4d => 313
	i64 8623059219396073920, ; 351: System.Net.Quic.dll => 0x77ab42ac514299c0 => 71
	i64 8626175481042262068, ; 352: Java.Interop => 0x77b654e585b55834 => 168
	i64 8629949569649228835, ; 353: DevExpress.RichEdit.v23.2.Core.dll => 0x77c3bd69007a3c23 => 198
	i64 8638972117149407195, ; 354: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 1
	i64 8639588376636138208, ; 355: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 300
	i64 8648495978913578441, ; 356: Microsoft.Win32.Registry.dll => 0x7805a1456889bdc9 => 5
	i64 8677882282824630478, ; 357: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 354
	i64 8684531736582871431, ; 358: System.IO.Compression.FileSystem => 0x7885a79a0fa0d987 => 44
	i64 8725526185868997716, ; 359: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 27
	i64 8853378295825400934, ; 360: Xamarin.Kotlin.StdLib.Common.dll => 0x7add84a720d38466 => 328
	i64 8877058193879496586, ; 361: DevExpress.Pdf.v23.2.Core => 0x7b31a56508a8778a => 195
	i64 8941376889969657626, ; 362: System.Xml.XDocument => 0x7c1626e87187471a => 158
	i64 8951477988056063522, ; 363: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0x7c3a09cd9ccf5e22 => 303
	i64 8954753533646919997, ; 364: System.Runtime.Serialization.Json => 0x7c45ace50032d93d => 112
	i64 9045785047181495996, ; 365: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 364
	i64 9111603110219107042, ; 366: Microsoft.Extensions.Caching.Memory => 0x7e72eac0def44ae2 => 209
	i64 9138683372487561558, ; 367: System.Security.Cryptography.Csp => 0x7ed3201bc3e3d156 => 121
	i64 9250544137016314866, ; 368: Microsoft.EntityFrameworkCore => 0x806088e191ee0bf2 => 204
	i64 9312692141327339315, ; 369: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 318
	i64 9324707631942237306, ; 370: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 258
	i64 9363564275759486853, ; 371: el\Microsoft.Maui.Controls.resources.dll => 0x81f21019382e9785 => 338
	i64 9427266486299436557, ; 372: Microsoft.IdentityModel.Logging.dll => 0x82d460ebe6d2a60d => 223
	i64 9468215723722196442, ; 373: System.Xml.XPath.XDocument.dll => 0x8365dc09353ac5da => 159
	i64 9551379474083066910, ; 374: uk\Microsoft.Maui.Controls.resources.dll => 0x848d5106bbadb41e => 362
	i64 9552911931735491231, ; 375: DXNavigation.a => 0x8492c2c9d5af429f => 184
	i64 9554839972845591462, ; 376: System.ServiceModel.Web => 0x84999c54e32a1ba6 => 131
	i64 9575902398040817096, ; 377: Xamarin.Google.Crypto.Tink.Android.dll => 0x84e4707ee708bdc8 => 323
	i64 9584643793929893533, ; 378: System.IO.dll => 0x85037ebfbbd7f69d => 57
	i64 9659729154652888475, ; 379: System.Text.RegularExpressions => 0x860e407c9991dd9b => 138
	i64 9662334977499516867, ; 380: System.Numerics.dll => 0x8617827802b0cfc3 => 83
	i64 9667360217193089419, ; 381: System.Diagnostics.StackTrace => 0x86295ce5cd89898b => 30
	i64 9678050649315576968, ; 382: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 270
	i64 9702891218465930390, ; 383: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 10
	i64 9723831379162822239, ; 384: DevExpress.Office.v23.2.Core.dll => 0x86f1fd1ecacbf65f => 194
	i64 9737654085557355179, ; 385: Serilog => 0x872318cc6b4702ab => 233
	i64 9773637193738963987, ; 386: ca\Microsoft.Maui.Controls.resources.dll => 0x87a2ef3ea85b4c13 => 334
	i64 9780093022148426479, ; 387: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x87b9dec9576efaef => 320
	i64 9808709177481450983, ; 388: Mono.Android.dll => 0x881f890734e555e7 => 171
	i64 9825649861376906464, ; 389: Xamarin.AndroidX.Concurrent.Futures => 0x885bb87d8abc94e0 => 267
	i64 9834056768316610435, ; 390: System.Transactions.dll => 0x8879968718899783 => 150
	i64 9836529246295212050, ; 391: System.Reflection.Metadata => 0x88825f3bbc2ac012 => 94
	i64 9864956466380592553, ; 392: Microsoft.EntityFrameworkCore.Sqlite => 0x88e75da3af4ed5a9 => 207
	i64 9907349773706910547, ; 393: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x897dfa20b758db53 => 280
	i64 9933555792566666578, ; 394: System.Linq.Queryable.dll => 0x89db145cf475c552 => 60
	i64 9956195530459977388, ; 395: Microsoft.Maui => 0x8a2b8315b36616ac => 228
	i64 9974604633896246661, ; 396: System.Xml.Serialization.dll => 0x8a6cea111a59dd85 => 157
	i64 9990311192647791659, ; 397: cs\System.Private.ServiceModel.resources => 0x8aa4b7194961742b => 367
	i64 10017511394021241210, ; 398: Microsoft.Extensions.Logging.Debug => 0x8b055989ae10717a => 217
	i64 10038780035334861115, ; 399: System.Net.Http.dll => 0x8b50e941206af13b => 64
	i64 10050344524905413833, ; 400: zh-Hans\System.Private.ServiceModel.resources.dll => 0x8b79ff18ad477cc9 => 378
	i64 10051358222726253779, ; 401: System.Private.Xml => 0x8b7d990c97ccccd3 => 88
	i64 10078727084704864206, ; 402: System.Net.WebSockets.Client => 0x8bded4e257f117ce => 79
	i64 10080807920783533798, ; 403: DXGrid.a.dll => 0x8be63964bf3f26e6 => 188
	i64 10089571585547156312, ; 404: System.IO.FileSystem.AccessControl => 0x8c055be67469bb58 => 47
	i64 10092835686693276772, ; 405: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 226
	i64 10096670194649521199, ; 406: System.ServiceModel.Primitives => 0x8c1e940c2e5bdc2f => 247
	i64 10105485790837105934, ; 407: System.Threading.Tasks.Parallel => 0x8c3de5c91d9a650e => 143
	i64 10143853363526200146, ; 408: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 336
	i64 10144499162490521328, ; 409: ja\System.Private.ServiceModel.resources.dll => 0x8cc8803d8c7ec6f0 => 372
	i64 10209869394718195525, ; 410: nl\Microsoft.Maui.Controls.resources.dll => 0x8db0be1ecb4f7f45 => 352
	i64 10226222362177979215, ; 411: Xamarin.Kotlin.StdLib.Jdk7 => 0x8dead70ebbc6434f => 329
	i64 10229024438826829339, ; 412: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 274
	i64 10236703004850800690, ; 413: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 74
	i64 10245369515835430794, ; 414: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 91
	i64 10321854143672141184, ; 415: Xamarin.Jetbrains.Annotations.dll => 0x8f3e97a7f8f8c580 => 326
	i64 10360651442923773544, ; 416: System.Text.Encoding => 0x8fc86d98211c1e68 => 135
	i64 10364469296367737616, ; 417: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 90
	i64 10376576884623852283, ; 418: Xamarin.AndroidX.Tracing.Tracing => 0x900101b2f888c2fb => 312
	i64 10406448008575299332, ; 419: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 332
	i64 10430153318873392755, ; 420: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 271
	i64 10447083246144586668, ; 421: Microsoft.Bcl.AsyncInterfaces.dll => 0x90fb7edc816203ac => 202
	i64 10454871586088267783, ; 422: DevExpress.Maui.DataGrid => 0x91172a50b51db007 => 189
	i64 10506226065143327199, ; 423: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 334
	i64 10546663366131771576, ; 424: System.Runtime.Serialization.Json.dll => 0x925d4673efe8e8b8 => 112
	i64 10566960649245365243, ; 425: System.Globalization.dll => 0x92a562b96dcd13fb => 42
	i64 10595762989148858956, ; 426: System.Xml.XPath.XDocument => 0x930bb64cc472ea4c => 159
	i64 10670374202010151210, ; 427: Microsoft.Win32.Primitives.dll => 0x9414c8cd7b4ea92a => 4
	i64 10678444886965028446, ; 428: DevExpress.Maui.Editors.dll => 0x9431750c4123065e => 191
	i64 10713464919625732433, ; 429: DevExpress.Pdf.v23.2.Drawing.dll => 0x94addf94ffe69151 => 196
	i64 10714184849103829812, ; 430: System.Runtime.Extensions.dll => 0x94b06e5aa4b4bb34 => 103
	i64 10761706286639228993, ; 431: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0x955942d988382841 => 366
	i64 10785150219063592792, ; 432: System.Net.Primitives => 0x95ac8cfb68830758 => 70
	i64 10811915265162633087, ; 433: Microsoft.EntityFrameworkCore.Relational.dll => 0x960ba3a651a45f7f => 206
	i64 10822644899632537592, ; 434: System.Linq.Queryable => 0x9631c23204ca5ff8 => 60
	i64 10830817578243619689, ; 435: System.Formats.Tar => 0x964ecb340a447b69 => 39
	i64 10847732767863316357, ; 436: Xamarin.AndroidX.Arch.Core.Common => 0x968ae37a86db9f85 => 260
	i64 10880838204485145808, ; 437: CommunityToolkit.Maui.dll => 0x970080b2a4d614d0 => 173
	i64 10899834349646441345, ; 438: System.Web => 0x9743fd975946eb81 => 153
	i64 10943875058216066601, ; 439: System.IO.UnmanagedMemoryStream.dll => 0x97e07461df39de29 => 56
	i64 10947994639507038094, ; 440: System.Private.ServiceModel.dll => 0x97ef171ea2b29f8e => 243
	i64 10964653383833615866, ; 441: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 34
	i64 11002576679268595294, ; 442: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 216
	i64 11009005086950030778, ; 443: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 228
	i64 11019817191295005410, ; 444: Xamarin.AndroidX.Annotation.Jvm.dll => 0x98ee415998e1b2e2 => 257
	i64 11023048688141570732, ; 445: System.Core => 0x98f9bc61168392ac => 21
	i64 11037814507248023548, ; 446: System.Xml => 0x992e31d0412bf7fc => 163
	i64 11047101296015504039, ; 447: Microsoft.Win32.SystemEvents => 0x994f301942c2f2a7 => 231
	i64 11071824625609515081, ; 448: Xamarin.Google.ErrorProne.Annotations => 0x99a705d600e0a049 => 324
	i64 11089314871468410253, ; 449: DevExpress.Maui.CollectionView => 0x99e5291f3454c58d => 182
	i64 11103970607964515343, ; 450: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 345
	i64 11136029745144976707, ; 451: Jsr305Binding.dll => 0x9a8b200d4f8cd543 => 322
	i64 11156122287428000958, ; 452: th\Microsoft.Maui.Controls.resources.dll => 0x9ad2821cdcf6dcbe => 360
	i64 11157797727133427779, ; 453: fr\Microsoft.Maui.Controls.resources.dll => 0x9ad875ea9172e843 => 341
	i64 11162124722117608902, ; 454: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 317
	i64 11188319605227840848, ; 455: System.Threading.Overlapped => 0x9b44e5671724e550 => 140
	i64 11220793807500858938, ; 456: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 348
	i64 11226290749488709958, ; 457: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 219
	i64 11235648312900863002, ; 458: System.Reflection.DispatchProxy.dll => 0x9bed0a9c8fac441a => 89
	i64 11266672218131436043, ; 459: ru\System.Private.ServiceModel.resources.dll => 0x9c5b42b0627c920b => 376
	i64 11279799931850920893, ; 460: zh-Hans\System.Private.ServiceModel.resources => 0x9c89e6466b7313bd => 378
	i64 11329751333533450475, ; 461: System.Threading.Timer.dll => 0x9d3b5ccf6cc500eb => 147
	i64 11340910727871153756, ; 462: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 273
	i64 11347436699239206956, ; 463: System.Xml.XmlSerializer.dll => 0x9d7a318e8162502c => 162
	i64 11392833485892708388, ; 464: Xamarin.AndroidX.Print.dll => 0x9e1b79b18fcf6824 => 302
	i64 11398376662953476300, ; 465: Microsoft.EntityFrameworkCore.Sqlite.dll => 0x9e2f2b2f0b71c0cc => 207
	i64 11432101114902388181, ; 466: System.AppContext => 0x9ea6fb64e61a9dd5 => 6
	i64 11446671985764974897, ; 467: Mono.Android.Export => 0x9edabf8623efc131 => 169
	i64 11448276831755070604, ; 468: System.Diagnostics.TextWriterTraceListener => 0x9ee0731f77186c8c => 31
	i64 11468804212318019611, ; 469: pt-BR\System.Private.ServiceModel.resources.dll => 0x9f2960aab1b8201b => 375
	i64 11485890710487134646, ; 470: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 107
	i64 11503653075602048397, ; 471: System.ServiceModel.Http => 0x9fa52f85f697058d => 246
	i64 11508496261504176197, ; 472: Xamarin.AndroidX.Fragment.Ktx.dll => 0x9fb664600dde1045 => 283
	i64 11517440453979132662, ; 473: Microsoft.IdentityModel.Abstractions.dll => 0x9fd62b122523d2f6 => 221
	i64 11518296021396496455, ; 474: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 346
	i64 11529969570048099689, ; 475: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 317
	i64 11530571088791430846, ; 476: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 215
	i64 11580057168383206117, ; 477: Xamarin.AndroidX.Annotation => 0xa0b4a0a4103262e5 => 255
	i64 11591352189662810718, ; 478: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0xa0dcc167234c525e => 310
	i64 11597940890313164233, ; 479: netstandard => 0xa0f429ca8d1805c9 => 167
	i64 11672361001936329215, ; 480: Xamarin.AndroidX.Interpolator => 0xa1fc8e7d0a8999ff => 284
	i64 11692977985522001935, ; 481: System.Threading.Overlapped.dll => 0xa245cd869980680f => 140
	i64 11706634719259089117, ; 482: System.Linq.Dynamic.Core => 0xa2765240b4b158dd => 242
	i64 11707554492040141440, ; 483: System.Linq.Parallel.dll => 0xa27996c7fe94da80 => 59
	i64 11743665907891708234, ; 484: System.Threading.Tasks => 0xa2f9e1ec30c0214a => 144
	i64 11855031688536399763, ; 485: vi\Microsoft.Maui.Controls.resources.dll => 0xa485888294361f93 => 363
	i64 11962825259181731743, ; 486: DevExpress.Maui.DataGrid.Export => 0xa6047e310398ef9f => 190
	i64 11991047634523762324, ; 487: System.Net => 0xa668c24ad493ae94 => 81
	i64 12040886584167504988, ; 488: System.Net.ServicePoint => 0xa719d28d8e121c5c => 74
	i64 12063623837170009990, ; 489: System.Security => 0xa76a99f6ce740786 => 130
	i64 12096697103934194533, ; 490: System.Diagnostics.Contracts => 0xa7e019eccb7e8365 => 25
	i64 12102847907131387746, ; 491: System.Buffers => 0xa7f5f40c43256f62 => 7
	i64 12123043025855404482, ; 492: System.Reflection.Extensions.dll => 0xa83db366c0e359c2 => 93
	i64 12137774235383566651, ; 493: Xamarin.AndroidX.VectorDrawable => 0xa872095bbfed113b => 314
	i64 12145679461940342714, ; 494: System.Text.Json => 0xa88e1f1ebcb62fba => 137
	i64 12191646537372739477, ; 495: Xamarin.Android.Glide.dll => 0xa9316dee7f392795 => 249
	i64 12201331334810686224, ; 496: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 113
	i64 12207981047216551264, ; 497: OneOf.dll => 0xa96b7614f00b3560 => 232
	i64 12269460666702402136, ; 498: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 9
	i64 12279246230491828964, ; 499: SQLitePCLRaw.provider.e_sqlite3.dll => 0xaa68a5636e0512e4 => 239
	i64 12310643388884616687, ; 500: fr\System.Private.ServiceModel.resources => 0xaad830f006fa85ef => 370
	i64 12332222936682028543, ; 501: System.Runtime.Handles => 0xab24db6c07db5dff => 104
	i64 12341818387765915815, ; 502: CommunityToolkit.Maui.Core.dll => 0xab46f26f152bf0a7 => 174
	i64 12342184558428949313, ; 503: System.ServiceModel.Primitives.dll => 0xab483f76d5780b41 => 247
	i64 12375446203996702057, ; 504: System.Configuration.dll => 0xabbe6ac12e2e0569 => 19
	i64 12439275739440478309, ; 505: Microsoft.IdentityModel.JsonWebTokens => 0xaca12f61007bf865 => 222
	i64 12451044538927396471, ; 506: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 282
	i64 12466513435562512481, ; 507: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 296
	i64 12475113361194491050, ; 508: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 381
	i64 12487638416075308985, ; 509: Xamarin.AndroidX.DocumentFile.dll => 0xad4d00fa21b0bfb9 => 276
	i64 12508989635011189811, ; 510: DevExpress.Data.v23.2.dll => 0xad98dbcc2de29c33 => 176
	i64 12517810545449516888, ; 511: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 33
	i64 12536103770525706882, ; 512: zh-Hant\System.Private.ServiceModel.resources.dll => 0xadf92ff5cd9eaa82 => 379
	i64 12538491095302438457, ; 513: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 264
	i64 12550732019250633519, ; 514: System.IO.Compression => 0xae2d28465e8e1b2f => 46
	i64 12699999919562409296, ; 515: System.Diagnostics.StackTrace.dll => 0xb03f76a3ad01c550 => 30
	i64 12700543734426720211, ; 516: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 265
	i64 12708238894395270091, ; 517: System.IO => 0xb05cbbf17d3ba3cb => 57
	i64 12708922737231849740, ; 518: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 134
	i64 12717050818822477433, ; 519: System.Runtime.Serialization.Xml.dll => 0xb07c0a5786811679 => 114
	i64 12753841065332862057, ; 520: Xamarin.AndroidX.Window => 0xb0febee04cf46c69 => 319
	i64 12800878955599098772, ; 521: ja\System.Private.ServiceModel.resources => 0xb1a5db969141f394 => 372
	i64 12821437452680551383, ; 522: DevExpress.Drawing.v23.2.Skia => 0xb1eee56eace9dbd7 => 178
	i64 12824731971458351941, ; 523: DevExpress.Drawing.v23.2 => 0xb1fa99c79a5ec345 => 177
	i64 12828192437253469131, ; 524: Xamarin.Kotlin.StdLib.Jdk8.dll => 0xb206e50e14d873cb => 330
	i64 12835242264250840079, ; 525: System.IO.Pipes => 0xb21ff0d5d6c0740f => 55
	i64 12843321153144804894, ; 526: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 220
	i64 12843770487262409629, ; 527: System.AppContext.dll => 0xb23e3d357debf39d => 6
	i64 12859557719246324186, ; 528: System.Net.WebHeaderCollection.dll => 0xb276539ce04f41da => 77
	i64 12963446364377008305, ; 529: System.Drawing.Common.dll => 0xb3e769c8fd8548b1 => 240
	i64 12982280885948128408, ; 530: Xamarin.AndroidX.CustomView.PoolingContainer => 0xb42a53aec5481c98 => 275
	i64 12989346753972519995, ; 531: ar\Microsoft.Maui.Controls.resources.dll => 0xb4436e0d5ee7c43b => 333
	i64 13005833372463390146, ; 532: pt-BR\Microsoft.Maui.Controls.resources.dll => 0xb47e008b5d99ddc2 => 354
	i64 13068258254871114833, ; 533: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 111
	i64 13106026140046202731, ; 534: HarfBuzzSharp.dll => 0xb5e1f555ee70176b => 201
	i64 13129914918964716986, ; 535: Xamarin.AndroidX.Emoji2.dll => 0xb636d40db3fe65ba => 279
	i64 13173818576982874404, ; 536: System.Runtime.CompilerServices.VisualC.dll => 0xb6d2ce32a8819924 => 102
	i64 13236013933113115140, ; 537: DXScheduler.a => 0xb7afc48b75540204 => 192
	i64 13301758418642884795, ; 538: CawoodClinic.Shared.dll => 0xb89956ce574558bb => 380
	i64 13315587268572539134, ; 539: DevExpress.Maui.DataGrid.dll => 0xb8ca78125efae8fe => 189
	i64 13343850469010654401, ; 540: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 170
	i64 13370592475155966277, ; 541: System.Runtime.Serialization => 0xb98de304062ea945 => 115
	i64 13381594904270902445, ; 542: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 342
	i64 13401370062847626945, ; 543: Xamarin.AndroidX.VectorDrawable.dll => 0xb9fb3b1193964ec1 => 314
	i64 13403654910141513527, ; 544: pl\System.Private.ServiceModel.resources.dll => 0xba0359200ae7bf37 => 374
	i64 13404347523447273790, ; 545: Xamarin.AndroidX.ConstraintLayout.Core => 0xba05cf0da4f6393e => 269
	i64 13431476299110033919, ; 546: System.Net.WebClient => 0xba663087f18829ff => 76
	i64 13454009404024712428, ; 547: Xamarin.Google.Guava.ListenableFuture => 0xbab63e4543a86cec => 325
	i64 13463706743370286408, ; 548: System.Private.DataContractSerialization.dll => 0xbad8b1f3069e0548 => 85
	i64 13465488254036897740, ; 549: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 327
	i64 13491513212026656886, ; 550: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0xbb3b7bc905569876 => 261
	i64 13540124433173649601, ; 551: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 363
	i64 13572454107664307259, ; 552: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 304
	i64 13578472628727169633, ; 553: System.Xml.XPath => 0xbc706ce9fba5c261 => 160
	i64 13580399111273692417, ; 554: Microsoft.VisualBasic.Core.dll => 0xbc77450a277fbd01 => 2
	i64 13621154251410165619, ; 555: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0xbd080f9faa1acf73 => 275
	i64 13647894001087880694, ; 556: System.Data.dll => 0xbd670f48cb071df6 => 24
	i64 13675589307506966157, ; 557: Xamarin.AndroidX.Activity.Ktx => 0xbdc97404d0153e8d => 254
	i64 13702626353344114072, ; 558: System.Diagnostics.Tools.dll => 0xbe29821198fb6d98 => 32
	i64 13710614125866346983, ; 559: System.Security.AccessControl.dll => 0xbe45e2e7d0b769e7 => 117
	i64 13713329104121190199, ; 560: System.Dynamic.Runtime => 0xbe4f8829f32b5737 => 37
	i64 13717397318615465333, ; 561: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 16
	i64 13768883594457632599, ; 562: System.IO.IsolatedStorage => 0xbf14e6adb159cf57 => 52
	i64 13828521679616088467, ; 563: Xamarin.Kotlin.StdLib.Common => 0xbfe8c733724e1993 => 328
	i64 13830070810343648044, ; 564: System.ServiceModel.Http.dll => 0xbfee48208d082b2c => 246
	i64 13880527146319145818, ; 565: System.Private.ServiceModel => 0xc0a189e5bb84eb5a => 243
	i64 13881769479078963060, ; 566: System.Console.dll => 0xc0a5f3cade5c6774 => 20
	i64 13911222732217019342, ; 567: System.Security.Cryptography.OpenSsl.dll => 0xc10e975ec1226bce => 123
	i64 13928444506500929300, ; 568: System.Windows.dll => 0xc14bc67b8bba9714 => 154
	i64 13955418299340266673, ; 569: Microsoft.Extensions.DependencyModel.dll => 0xc1ab9b0118299cb1 => 214
	i64 13959074834287824816, ; 570: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 282
	i64 14035426118005234609, ; 571: System.Linq.Dynamic.Core.dll => 0xc2c7d9b102f11bb1 => 242
	i64 14075334701871371868, ; 572: System.ServiceModel.Web.dll => 0xc355a25647c5965c => 131
	i64 14124974489674258913, ; 573: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 264
	i64 14125464355221830302, ; 574: System.Threading.dll => 0xc407bafdbc707a9e => 148
	i64 14133832980772275001, ; 575: Microsoft.EntityFrameworkCore.dll => 0xc425763635a1c339 => 204
	i64 14178052285788134900, ; 576: Xamarin.Android.Glide.Annotations.dll => 0xc4c28f6f75511df4 => 250
	i64 14212104595480609394, ; 577: System.Security.Cryptography.Cng.dll => 0xc53b89d4a4518272 => 120
	i64 14220608275227875801, ; 578: System.Diagnostics.FileVersionInfo.dll => 0xc559bfe1def019d9 => 28
	i64 14226382999226559092, ; 579: System.ServiceProcess => 0xc56e43f6938e2a74 => 132
	i64 14232023429000439693, ; 580: System.Resources.Writer.dll => 0xc5824de7789ba78d => 100
	i64 14254574811015963973, ; 581: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 134
	i64 14261073672896646636, ; 582: Xamarin.AndroidX.Print => 0xc5e982f274ae0dec => 302
	i64 14298246716367104064, ; 583: System.Web.dll => 0xc66d93a217f4e840 => 153
	i64 14327695147300244862, ; 584: System.Reflection.dll => 0xc6d632d338eb4d7e => 97
	i64 14327709162229390963, ; 585: System.Security.Cryptography.X509Certificates => 0xc6d63f9253cade73 => 125
	i64 14331727281556788554, ; 586: Xamarin.Android.Glide.DiskLruCache.dll => 0xc6e48607a2f7954a => 251
	i64 14346402571976470310, ; 587: System.Net.Ping.dll => 0xc718a920f3686f26 => 69
	i64 14349907877893689639, ; 588: ro\Microsoft.Maui.Controls.resources.dll => 0xc7251d2f956ed127 => 356
	i64 14461014870687870182, ; 589: System.Net.Requests.dll => 0xc8afd8683afdece6 => 72
	i64 14464374589798375073, ; 590: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 357
	i64 14486659737292545672, ; 591: Xamarin.AndroidX.Lifecycle.LiveData => 0xc90af44707469e88 => 287
	i64 14491877563792607819, ; 592: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0xc91d7ddcee4fca4b => 365
	i64 14495724990987328804, ; 593: Xamarin.AndroidX.ResourceInspection.Annotation => 0xc92b2913e18d5d24 => 305
	i64 14551742072151931844, ; 594: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 136
	i64 14556034074661724008, ; 595: CommunityToolkit.Maui.Core => 0xca016bdea6b19f68 => 174
	i64 14561513370130550166, ; 596: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 124
	i64 14574160591280636898, ; 597: System.Net.Quic => 0xca41d1d72ec783e2 => 71
	i64 14610046442689856844, ; 598: cs\Microsoft.Maui.Controls.resources.dll => 0xcac14fd5107d054c => 335
	i64 14622043554576106986, ; 599: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 111
	i64 14644440854989303794, ; 600: Xamarin.AndroidX.LocalBroadcastManager.dll => 0xcb3b815e37daeff2 => 297
	i64 14653669531502871807, ; 601: DevExpress.Maui.Core.dll => 0xcb5c4acce93184ff => 187
	i64 14669215534098758659, ; 602: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 212
	i64 14690985099581930927, ; 603: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 152
	i64 14705122255218365489, ; 604: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 349
	i64 14735017007120366644, ; 605: ja\Microsoft.Maui.Controls.resources.dll => 0xcc7d4be604bfbc34 => 348
	i64 14744092281598614090, ; 606: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 365
	i64 14792063746108907174, ; 607: Xamarin.Google.Guava.ListenableFuture.dll => 0xcd47f79af9c15ea6 => 325
	i64 14832630590065248058, ; 608: System.Security.Claims => 0xcdd816ef5d6e873a => 118
	i64 14852515768018889994, ; 609: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 273
	i64 14854631724902097852, ; 610: es\System.Private.ServiceModel.resources.dll => 0xce2640d9c009a3bc => 369
	i64 14889905118082851278, ; 611: GoogleGson.dll => 0xcea391d0969961ce => 200
	i64 14904040806490515477, ; 612: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 333
	i64 14912225920358050525, ; 613: System.Security.Principal.Windows => 0xcef2de7759506add => 127
	i64 14931407803744742450, ; 614: HarfBuzzSharp => 0xcf3704499ab36c32 => 201
	i64 14935719434541007538, ; 615: System.Text.Encoding.CodePages.dll => 0xcf4655b160b702b2 => 133
	i64 14954917835170835695, ; 616: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 213
	i64 14984936317414011727, ; 617: System.Net.WebHeaderCollection => 0xcff5302fe54ff34f => 77
	i64 14987728460634540364, ; 618: System.IO.Compression.dll => 0xcfff1ba06622494c => 46
	i64 14988210264188246988, ; 619: Xamarin.AndroidX.DocumentFile => 0xd000d1d307cddbcc => 276
	i64 15015154896917945444, ; 620: System.Net.Security.dll => 0xd0608bd33642dc64 => 73
	i64 15024878362326791334, ; 621: System.Net.Http.Json => 0xd0831743ebf0f4a6 => 63
	i64 15071021337266399595, ; 622: System.Resources.Reader.dll => 0xd127060e7a18a96b => 98
	i64 15076659072870671916, ; 623: System.ObjectModel.dll => 0xd13b0d8c1620662c => 84
	i64 15111608613780139878, ; 624: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 350
	i64 15115185479366240210, ; 625: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 43
	i64 15133485256822086103, ; 626: System.Linq.dll => 0xd204f0a9127dd9d7 => 61
	i64 15138356091203993725, ; 627: Microsoft.IdentityModel.Abstractions => 0xd2163ea89395c07d => 221
	i64 15145995544628845172, ; 628: DXCharts.a.dll => 0xd23162b36f405a74 => 179
	i64 15150743910298169673, ; 629: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xd2424150783c3149 => 303
	i64 15203009853192377507, ; 630: pt\Microsoft.Maui.Controls.resources.dll => 0xd2fbf0e9984b94a3 => 355
	i64 15227001540531775957, ; 631: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 211
	i64 15234786388537674379, ; 632: System.Dynamic.Runtime.dll => 0xd36cd580c5be8a8b => 37
	i64 15250465174479574862, ; 633: System.Globalization.Calendars.dll => 0xd3a489469852174e => 40
	i64 15272359115529052076, ; 634: Xamarin.AndroidX.Collection.Ktx => 0xd3f251b2fb4edfac => 266
	i64 15279429628684179188, ; 635: Xamarin.KotlinX.Coroutines.Android.dll => 0xd40b704b1c4c96f4 => 331
	i64 15299439993936780255, ; 636: System.Xml.XPath.dll => 0xd452879d55019bdf => 160
	i64 15338463749992804988, ; 637: System.Resources.Reader => 0xd4dd2b839286f27c => 98
	i64 15370334346939861994, ; 638: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 271
	i64 15391712275433856905, ; 639: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 213
	i64 15526743539506359484, ; 640: System.Text.Encoding.dll => 0xd77a12fc26de2cbc => 135
	i64 15527772828719725935, ; 641: System.Console => 0xd77dbb1e38cd3d6f => 20
	i64 15530465045505749832, ; 642: System.Net.HttpListener.dll => 0xd7874bacc9fdb348 => 65
	i64 15536481058354060254, ; 643: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 337
	i64 15541854775306130054, ; 644: System.Security.Cryptography.X509Certificates.dll => 0xd7afc292e8d49286 => 125
	i64 15557562860424774966, ; 645: System.Net.Sockets => 0xd7e790fe7a6dc536 => 75
	i64 15582737692548360875, ; 646: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 295
	i64 15609085926864131306, ; 647: System.dll => 0xd89e9cf3334914ea => 164
	i64 15620595871140898079, ; 648: Microsoft.Extensions.DependencyModel => 0xd8c7812eef49651f => 214
	i64 15661133872274321916, ; 649: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 156
	i64 15710114879900314733, ; 650: Microsoft.Win32.Registry => 0xda058a3f5d096c6d => 5
	i64 15755368083429170162, ; 651: System.IO.FileSystem.Primitives => 0xdaa64fcbde529bf2 => 49
	i64 15777549416145007739, ; 652: Xamarin.AndroidX.SlidingPaneLayout.dll => 0xdaf51d99d77eb47b => 309
	i64 15783653065526199428, ; 653: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 338
	i64 15817206913877585035, ; 654: System.Threading.Tasks.dll => 0xdb8201e29086ac8b => 144
	i64 15817855017947507027, ; 655: es\System.Private.ServiceModel.resources => 0xdb844f550d642953 => 369
	i64 15847085070278954535, ; 656: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 139
	i64 15885744048853936810, ; 657: System.Resources.Writer => 0xdc75800bd0b6eaaa => 100
	i64 15928521404965645318, ; 658: Microsoft.Maui.Controls.Compatibility => 0xdd0d79d32c2eec06 => 225
	i64 15934062614519587357, ; 659: System.Security.Cryptography.OpenSsl => 0xdd2129868f45a21d => 123
	i64 15937190497610202713, ; 660: System.Security.Cryptography.Cng => 0xdd2c465197c97e59 => 120
	i64 15949342492168962360, ; 661: it\System.Private.ServiceModel.resources => 0xdd57727e4ec64138 => 371
	i64 15963349826457351533, ; 662: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 142
	i64 15971679995444160383, ; 663: System.Formats.Tar.dll => 0xdda6ce5592a9677f => 39
	i64 16018552496348375205, ; 664: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 68
	i64 16046481083542319511, ; 665: Microsoft.Extensions.ObjectPool => 0xdeb08d870f90b197 => 218
	i64 16054465462676478687, ; 666: System.Globalization.Extensions => 0xdecceb47319bdadf => 41
	i64 16056281320585338352, ; 667: ru\Microsoft.Maui.Controls.resources.dll => 0xded35eca8f3a9df0 => 357
	i64 16154507427712707110, ; 668: System => 0xe03056ea4e39aa26 => 164
	i64 16219561732052121626, ; 669: System.Net.Security => 0xe1177575db7c781a => 73
	i64 16288847719894691167, ; 670: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 351
	i64 16315482530584035869, ; 671: WindowsBase.dll => 0xe26c3ceb1e8d821d => 165
	i64 16321164108206115771, ; 672: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 216
	i64 16324796876805858114, ; 673: SkiaSharp.dll => 0xe28d5444586b6342 => 234
	i64 16337011941688632206, ; 674: System.Security.Principal.Windows.dll => 0xe2b8b9cdc3aa638e => 127
	i64 16361933716545543812, ; 675: Xamarin.AndroidX.ExifInterface.dll => 0xe3114406a52f1e84 => 281
	i64 16423015068819898779, ; 676: Xamarin.Kotlin.StdLib.Jdk8 => 0xe3ea453135e5c19b => 330
	i64 16454459195343277943, ; 677: System.Net.NetworkInformation => 0xe459fb756d988f77 => 68
	i64 16496768397145114574, ; 678: Mono.Android.Export.dll => 0xe4f04b741db987ce => 169
	i64 16589693266713801121, ; 679: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xe63a6e214f2a71a1 => 294
	i64 16621146507174665210, ; 680: Xamarin.AndroidX.ConstraintLayout => 0xe6aa2caf87dedbfa => 268
	i64 16648892297579399389, ; 681: CommunityToolkit.Mvvm => 0xe70cbf55c4f508dd => 175
	i64 16649148416072044166, ; 682: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 230
	i64 16677317093839702854, ; 683: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 301
	i64 16702652415771857902, ; 684: System.ValueTuple => 0xe7cbbde0b0e6d3ee => 151
	i64 16709499819875633724, ; 685: System.IO.Compression.ZipFile => 0xe7e4118e32240a3c => 45
	i64 16737807731308835127, ; 686: System.Runtime.Intrinsics => 0xe848a3736f733137 => 108
	i64 16738961482059635536, ; 687: DevExpress.Pdf.v23.2.Core.dll => 0xe84cbcc7f71c5b50 => 195
	i64 16755018182064898362, ; 688: SQLitePCLRaw.core.dll => 0xe885c843c330813a => 237
	i64 16758309481308491337, ; 689: System.IO.FileSystem.DriveInfo => 0xe89179af15740e49 => 48
	i64 16762783179241323229, ; 690: System.Reflection.TypeExtensions => 0xe8a15e7d0d927add => 96
	i64 16765015072123548030, ; 691: System.Diagnostics.TextWriterTraceListener.dll => 0xe8a94c621bfe717e => 31
	i64 16795178957077639253, ; 692: DXCore.a => 0xe9147646dbba7055 => 186
	i64 16803648858859583026, ; 693: ms\Microsoft.Maui.Controls.resources.dll => 0xe9328d9b8ab93632 => 350
	i64 16822611501064131242, ; 694: System.Data.DataSetExtensions => 0xe975ec07bb5412aa => 23
	i64 16833383113903931215, ; 695: mscorlib => 0xe99c30c1484d7f4f => 166
	i64 16856067890322379635, ; 696: System.Data.Common.dll => 0xe9ecc87060889373 => 22
	i64 16869824188424882475, ; 697: DevExpress.RichEdit.v23.2.Core => 0xea1da7b81e5b892b => 198
	i64 16890310621557459193, ; 698: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 138
	i64 16933958494752847024, ; 699: System.Net.WebProxy.dll => 0xeb018187f0f3b4b0 => 78
	i64 16942731696432749159, ; 700: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 358
	i64 16977952268158210142, ; 701: System.IO.Pipes.AccessControl => 0xeb9dcda2851b905e => 54
	i64 16989020923549080504, ; 702: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xebc52084add25bb8 => 294
	i64 16998075588627545693, ; 703: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 299
	i64 17008137082415910100, ; 704: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 10
	i64 17024911836938395553, ; 705: Xamarin.AndroidX.Annotation.Experimental.dll => 0xec44a31d250e5fa1 => 256
	i64 17031351772568316411, ; 706: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 298
	i64 17037200463775726619, ; 707: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xec704b8e0a78fc1b => 285
	i64 17062143951396181894, ; 708: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 16
	i64 17118171214553292978, ; 709: System.Threading.Channels => 0xed8ff6060fc420b2 => 139
	i64 17137864900836977098, ; 710: Microsoft.IdentityModel.Tokens => 0xedd5ed53b705e9ca => 224
	i64 17187273293601214786, ; 711: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 13
	i64 17201328579425343169, ; 712: System.ComponentModel.EventBasedAsync => 0xeeb76534d96c16c1 => 15
	i64 17202182880784296190, ; 713: System.Security.Cryptography.Encoding.dll => 0xeeba6e30627428fe => 122
	i64 17203614576212522419, ; 714: pl\Microsoft.Maui.Controls.resources.dll => 0xeebf844ef3e135b3 => 353
	i64 17230721278011714856, ; 715: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 87
	i64 17234219099804750107, ; 716: System.Transactions.Local.dll => 0xef2c3ef5e11d511b => 149
	i64 17260702271250283638, ; 717: System.Data.Common => 0xef8a5543bba6bc76 => 22
	i64 17310278548634113468, ; 718: hi\Microsoft.Maui.Controls.resources.dll => 0xf03a76a04e6695bc => 343
	i64 17333249706306540043, ; 719: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 34
	i64 17338386382517543202, ; 720: System.Net.WebSockets.Client.dll => 0xf09e528d5c6da122 => 79
	i64 17342750010158924305, ; 721: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 343
	i64 17348749373414901731, ; 722: tr\System.Private.ServiceModel.resources.dll => 0xf0c323a333ad07e3 => 377
	i64 17360349973592121190, ; 723: Xamarin.Google.Crypto.Tink.Android => 0xf0ec5a52686b9f66 => 323
	i64 17470386307322966175, ; 724: System.Threading.Timer => 0xf27347c8d0d5709f => 147
	i64 17509662556995089465, ; 725: System.Net.WebSockets.dll => 0xf2fed1534ea67439 => 80
	i64 17514990004910432069, ; 726: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 341
	i64 17522591619082469157, ; 727: GoogleGson => 0xf32cc03d27a5bf25 => 200
	i64 17590473451926037903, ; 728: Xamarin.Android.Glide => 0xf41dea67fcfda58f => 249
	i64 17623389608345532001, ; 729: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 353
	i64 17627500474728259406, ; 730: System.Globalization => 0xf4a176498a351f4e => 42
	i64 17685921127322830888, ; 731: System.Diagnostics.Debug.dll => 0xf571038fafa74828 => 26
	i64 17704177640604968747, ; 732: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 296
	i64 17710060891934109755, ; 733: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 293
	i64 17712670374920797664, ; 734: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 107
	i64 17777860260071588075, ; 735: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 110
	i64 17790600151040787804, ; 736: Microsoft.IdentityModel.Logging => 0xf6e4e89427cc055c => 223
	i64 17827813215687577648, ; 737: hr\Microsoft.Maui.Controls.resources.dll => 0xf7691da9f3129030 => 344
	i64 17838668724098252521, ; 738: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 7
	i64 17891337867145587222, ; 739: Xamarin.Jetbrains.Annotations => 0xf84accff6fb52a16 => 326
	i64 17928294245072900555, ; 740: System.IO.Compression.FileSystem.dll => 0xf8ce18a0b24011cb => 44
	i64 17942426894774770628, ; 741: de\Microsoft.Maui.Controls.resources.dll => 0xf9004e329f771bc4 => 337
	i64 17983703858104258717, ; 742: DevExpress.Maui.Charts.dll => 0xf992f3609020509d => 180
	i64 17992315986609351877, ; 743: System.Xml.XmlDocument.dll => 0xf9b18c0ffc6eacc5 => 161
	i64 18017743553296241350, ; 744: Microsoft.Extensions.Caching.Abstractions => 0xfa0be24cb44e92c6 => 208
	i64 18025913125965088385, ; 745: System.Threading => 0xfa28e87b91334681 => 148
	i64 18032611295476759751, ; 746: de\System.Private.ServiceModel.resources => 0xfa40b46eaf96bcc7 => 368
	i64 18116111925905154859, ; 747: Xamarin.AndroidX.Arch.Core.Runtime => 0xfb695bd036cb632b => 261
	i64 18121036031235206392, ; 748: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 298
	i64 18146411883821974900, ; 749: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 38
	i64 18146811631844267958, ; 750: System.ComponentModel.EventBasedAsync.dll => 0xfbd66d08820117b6 => 15
	i64 18203743254473369877, ; 751: System.Security.Cryptography.Pkcs.dll => 0xfca0b00ad94c6915 => 244
	i64 18225059387460068507, ; 752: System.Threading.ThreadPool.dll => 0xfcec6af3cff4a49b => 146
	i64 18245806341561545090, ; 753: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 8
	i64 18260797123374478311, ; 754: Xamarin.AndroidX.Emoji2 => 0xfd6b623bde35f3e7 => 279
	i64 18305135509493619199, ; 755: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 300
	i64 18318849532986632368, ; 756: System.Security.dll => 0xfe39a097c37fa8b0 => 130
	i64 18324163916253801303, ; 757: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 347
	i64 18342408478508122430, ; 758: id\Microsoft.Maui.Controls.resources.dll => 0xfe8d53543697013e => 346
	i64 18358161419737137786, ; 759: he\Microsoft.Maui.Controls.resources.dll => 0xfec54a8ba8b6827a => 342
	i64 18370042311372477656, ; 760: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0xfeef80274e4094d8 => 238
	i64 18380184030268848184, ; 761: Xamarin.AndroidX.VersionedParcelable => 0xff1387fe3e7b7838 => 316
	i64 18428404840311395189, ; 762: System.Security.Cryptography.Xml.dll => 0xffbed8907bd99375 => 245
	i64 18439108438687598470 ; 763: System.Reflection.Metadata.dll => 0xffe4df6e2ee1c786 => 94
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [764 x i32] [
	i32 278, ; 0
	i32 220, ; 1
	i32 171, ; 2
	i32 229, ; 3
	i32 58, ; 4
	i32 265, ; 5
	i32 151, ; 6
	i32 306, ; 7
	i32 309, ; 8
	i32 272, ; 9
	i32 132, ; 10
	i32 56, ; 11
	i32 308, ; 12
	i32 218, ; 13
	i32 197, ; 14
	i32 183, ; 15
	i32 95, ; 16
	i32 233, ; 17
	i32 374, ; 18
	i32 193, ; 19
	i32 291, ; 20
	i32 129, ; 21
	i32 240, ; 22
	i32 176, ; 23
	i32 145, ; 24
	i32 266, ; 25
	i32 18, ; 26
	i32 345, ; 27
	i32 238, ; 28
	i32 277, ; 29
	i32 292, ; 30
	i32 150, ; 31
	i32 104, ; 32
	i32 95, ; 33
	i32 321, ; 34
	i32 191, ; 35
	i32 36, ; 36
	i32 237, ; 37
	i32 28, ; 38
	i32 260, ; 39
	i32 183, ; 40
	i32 299, ; 41
	i32 50, ; 42
	i32 115, ; 43
	i32 70, ; 44
	i32 226, ; 45
	i32 65, ; 46
	i32 170, ; 47
	i32 239, ; 48
	i32 145, ; 49
	i32 320, ; 50
	i32 259, ; 51
	i32 295, ; 52
	i32 285, ; 53
	i32 40, ; 54
	i32 89, ; 55
	i32 203, ; 56
	i32 81, ; 57
	i32 66, ; 58
	i32 196, ; 59
	i32 62, ; 60
	i32 86, ; 61
	i32 258, ; 62
	i32 106, ; 63
	i32 339, ; 64
	i32 306, ; 65
	i32 102, ; 66
	i32 202, ; 67
	i32 35, ; 68
	i32 255, ; 69
	i32 361, ; 70
	i32 179, ; 71
	i32 308, ; 72
	i32 262, ; 73
	i32 227, ; 74
	i32 175, ; 75
	i32 119, ; 76
	i32 293, ; 77
	i32 142, ; 78
	i32 141, ; 79
	i32 329, ; 80
	i32 53, ; 81
	i32 35, ; 82
	i32 141, ; 83
	i32 252, ; 84
	i32 263, ; 85
	i32 235, ; 86
	i32 205, ; 87
	i32 217, ; 88
	i32 185, ; 89
	i32 277, ; 90
	i32 8, ; 91
	i32 14, ; 92
	i32 305, ; 93
	i32 51, ; 94
	i32 288, ; 95
	i32 136, ; 96
	i32 101, ; 97
	i32 270, ; 98
	i32 373, ; 99
	i32 315, ; 100
	i32 116, ; 101
	i32 253, ; 102
	i32 163, ; 103
	i32 360, ; 104
	i32 224, ; 105
	i32 166, ; 106
	i32 67, ; 107
	i32 212, ; 108
	i32 335, ; 109
	i32 376, ; 110
	i32 80, ; 111
	i32 373, ; 112
	i32 101, ; 113
	i32 310, ; 114
	i32 222, ; 115
	i32 117, ; 116
	i32 181, ; 117
	i32 340, ; 118
	i32 322, ; 119
	i32 78, ; 120
	i32 321, ; 121
	i32 114, ; 122
	i32 121, ; 123
	i32 48, ; 124
	i32 371, ; 125
	i32 231, ; 126
	i32 375, ; 127
	i32 194, ; 128
	i32 128, ; 129
	i32 286, ; 130
	i32 256, ; 131
	i32 82, ; 132
	i32 110, ; 133
	i32 75, ; 134
	i32 332, ; 135
	i32 262, ; 136
	i32 241, ; 137
	i32 379, ; 138
	i32 229, ; 139
	i32 53, ; 140
	i32 235, ; 141
	i32 312, ; 142
	i32 210, ; 143
	i32 69, ; 144
	i32 311, ; 145
	i32 209, ; 146
	i32 83, ; 147
	i32 172, ; 148
	i32 355, ; 149
	i32 116, ; 150
	i32 0, ; 151
	i32 248, ; 152
	i32 211, ; 153
	i32 156, ; 154
	i32 210, ; 155
	i32 250, ; 156
	i32 167, ; 157
	i32 304, ; 158
	i32 278, ; 159
	i32 215, ; 160
	i32 32, ; 161
	i32 227, ; 162
	i32 122, ; 163
	i32 72, ; 164
	i32 62, ; 165
	i32 161, ; 166
	i32 113, ; 167
	i32 336, ; 168
	i32 88, ; 169
	i32 225, ; 170
	i32 366, ; 171
	i32 187, ; 172
	i32 105, ; 173
	i32 18, ; 174
	i32 146, ; 175
	i32 118, ; 176
	i32 58, ; 177
	i32 272, ; 178
	i32 17, ; 179
	i32 52, ; 180
	i32 92, ; 181
	i32 236, ; 182
	i32 361, ; 183
	i32 186, ; 184
	i32 55, ; 185
	i32 182, ; 186
	i32 129, ; 187
	i32 188, ; 188
	i32 152, ; 189
	i32 41, ; 190
	i32 206, ; 191
	i32 92, ; 192
	i32 205, ; 193
	i32 316, ; 194
	i32 192, ; 195
	i32 50, ; 196
	i32 190, ; 197
	i32 162, ; 198
	i32 180, ; 199
	i32 13, ; 200
	i32 290, ; 201
	i32 253, ; 202
	i32 311, ; 203
	i32 36, ; 204
	i32 67, ; 205
	i32 109, ; 206
	i32 351, ; 207
	i32 359, ; 208
	i32 232, ; 209
	i32 0, ; 210
	i32 254, ; 211
	i32 99, ; 212
	i32 99, ; 213
	i32 11, ; 214
	i32 203, ; 215
	i32 11, ; 216
	i32 297, ; 217
	i32 380, ; 218
	i32 25, ; 219
	i32 128, ; 220
	i32 76, ; 221
	i32 289, ; 222
	i32 109, ; 223
	i32 368, ; 224
	i32 315, ; 225
	i32 313, ; 226
	i32 106, ; 227
	i32 2, ; 228
	i32 26, ; 229
	i32 268, ; 230
	i32 157, ; 231
	i32 177, ; 232
	i32 359, ; 233
	i32 21, ; 234
	i32 362, ; 235
	i32 49, ; 236
	i32 43, ; 237
	i32 126, ; 238
	i32 257, ; 239
	i32 59, ; 240
	i32 119, ; 241
	i32 318, ; 242
	i32 281, ; 243
	i32 267, ; 244
	i32 3, ; 245
	i32 287, ; 246
	i32 307, ; 247
	i32 38, ; 248
	i32 124, ; 249
	i32 307, ; 250
	i32 236, ; 251
	i32 356, ; 252
	i32 137, ; 253
	i32 149, ; 254
	i32 85, ; 255
	i32 90, ; 256
	i32 339, ; 257
	i32 291, ; 258
	i32 381, ; 259
	i32 288, ; 260
	i32 340, ; 261
	i32 344, ; 262
	i32 263, ; 263
	i32 274, ; 264
	i32 319, ; 265
	i32 219, ; 266
	i32 324, ; 267
	i32 289, ; 268
	i32 199, ; 269
	i32 133, ; 270
	i32 234, ; 271
	i32 96, ; 272
	i32 3, ; 273
	i32 352, ; 274
	i32 105, ; 275
	i32 33, ; 276
	i32 154, ; 277
	i32 158, ; 278
	i32 155, ; 279
	i32 82, ; 280
	i32 199, ; 281
	i32 283, ; 282
	i32 377, ; 283
	i32 193, ; 284
	i32 245, ; 285
	i32 143, ; 286
	i32 87, ; 287
	i32 19, ; 288
	i32 284, ; 289
	i32 244, ; 290
	i32 51, ; 291
	i32 184, ; 292
	i32 252, ; 293
	i32 181, ; 294
	i32 61, ; 295
	i32 54, ; 296
	i32 367, ; 297
	i32 4, ; 298
	i32 97, ; 299
	i32 251, ; 300
	i32 17, ; 301
	i32 370, ; 302
	i32 155, ; 303
	i32 84, ; 304
	i32 241, ; 305
	i32 248, ; 306
	i32 29, ; 307
	i32 45, ; 308
	i32 64, ; 309
	i32 66, ; 310
	i32 172, ; 311
	i32 292, ; 312
	i32 1, ; 313
	i32 327, ; 314
	i32 347, ; 315
	i32 185, ; 316
	i32 47, ; 317
	i32 24, ; 318
	i32 259, ; 319
	i32 208, ; 320
	i32 178, ; 321
	i32 358, ; 322
	i32 197, ; 323
	i32 165, ; 324
	i32 108, ; 325
	i32 12, ; 326
	i32 286, ; 327
	i32 63, ; 328
	i32 27, ; 329
	i32 23, ; 330
	i32 349, ; 331
	i32 93, ; 332
	i32 168, ; 333
	i32 12, ; 334
	i32 331, ; 335
	i32 230, ; 336
	i32 29, ; 337
	i32 103, ; 338
	i32 14, ; 339
	i32 126, ; 340
	i32 364, ; 341
	i32 269, ; 342
	i32 301, ; 343
	i32 91, ; 344
	i32 290, ; 345
	i32 9, ; 346
	i32 86, ; 347
	i32 280, ; 348
	i32 173, ; 349
	i32 313, ; 350
	i32 71, ; 351
	i32 168, ; 352
	i32 198, ; 353
	i32 1, ; 354
	i32 300, ; 355
	i32 5, ; 356
	i32 354, ; 357
	i32 44, ; 358
	i32 27, ; 359
	i32 328, ; 360
	i32 195, ; 361
	i32 158, ; 362
	i32 303, ; 363
	i32 112, ; 364
	i32 364, ; 365
	i32 209, ; 366
	i32 121, ; 367
	i32 204, ; 368
	i32 318, ; 369
	i32 258, ; 370
	i32 338, ; 371
	i32 223, ; 372
	i32 159, ; 373
	i32 362, ; 374
	i32 184, ; 375
	i32 131, ; 376
	i32 323, ; 377
	i32 57, ; 378
	i32 138, ; 379
	i32 83, ; 380
	i32 30, ; 381
	i32 270, ; 382
	i32 10, ; 383
	i32 194, ; 384
	i32 233, ; 385
	i32 334, ; 386
	i32 320, ; 387
	i32 171, ; 388
	i32 267, ; 389
	i32 150, ; 390
	i32 94, ; 391
	i32 207, ; 392
	i32 280, ; 393
	i32 60, ; 394
	i32 228, ; 395
	i32 157, ; 396
	i32 367, ; 397
	i32 217, ; 398
	i32 64, ; 399
	i32 378, ; 400
	i32 88, ; 401
	i32 79, ; 402
	i32 188, ; 403
	i32 47, ; 404
	i32 226, ; 405
	i32 247, ; 406
	i32 143, ; 407
	i32 336, ; 408
	i32 372, ; 409
	i32 352, ; 410
	i32 329, ; 411
	i32 274, ; 412
	i32 74, ; 413
	i32 91, ; 414
	i32 326, ; 415
	i32 135, ; 416
	i32 90, ; 417
	i32 312, ; 418
	i32 332, ; 419
	i32 271, ; 420
	i32 202, ; 421
	i32 189, ; 422
	i32 334, ; 423
	i32 112, ; 424
	i32 42, ; 425
	i32 159, ; 426
	i32 4, ; 427
	i32 191, ; 428
	i32 196, ; 429
	i32 103, ; 430
	i32 366, ; 431
	i32 70, ; 432
	i32 206, ; 433
	i32 60, ; 434
	i32 39, ; 435
	i32 260, ; 436
	i32 173, ; 437
	i32 153, ; 438
	i32 56, ; 439
	i32 243, ; 440
	i32 34, ; 441
	i32 216, ; 442
	i32 228, ; 443
	i32 257, ; 444
	i32 21, ; 445
	i32 163, ; 446
	i32 231, ; 447
	i32 324, ; 448
	i32 182, ; 449
	i32 345, ; 450
	i32 322, ; 451
	i32 360, ; 452
	i32 341, ; 453
	i32 317, ; 454
	i32 140, ; 455
	i32 348, ; 456
	i32 219, ; 457
	i32 89, ; 458
	i32 376, ; 459
	i32 378, ; 460
	i32 147, ; 461
	i32 273, ; 462
	i32 162, ; 463
	i32 302, ; 464
	i32 207, ; 465
	i32 6, ; 466
	i32 169, ; 467
	i32 31, ; 468
	i32 375, ; 469
	i32 107, ; 470
	i32 246, ; 471
	i32 283, ; 472
	i32 221, ; 473
	i32 346, ; 474
	i32 317, ; 475
	i32 215, ; 476
	i32 255, ; 477
	i32 310, ; 478
	i32 167, ; 479
	i32 284, ; 480
	i32 140, ; 481
	i32 242, ; 482
	i32 59, ; 483
	i32 144, ; 484
	i32 363, ; 485
	i32 190, ; 486
	i32 81, ; 487
	i32 74, ; 488
	i32 130, ; 489
	i32 25, ; 490
	i32 7, ; 491
	i32 93, ; 492
	i32 314, ; 493
	i32 137, ; 494
	i32 249, ; 495
	i32 113, ; 496
	i32 232, ; 497
	i32 9, ; 498
	i32 239, ; 499
	i32 370, ; 500
	i32 104, ; 501
	i32 174, ; 502
	i32 247, ; 503
	i32 19, ; 504
	i32 222, ; 505
	i32 282, ; 506
	i32 296, ; 507
	i32 381, ; 508
	i32 276, ; 509
	i32 176, ; 510
	i32 33, ; 511
	i32 379, ; 512
	i32 264, ; 513
	i32 46, ; 514
	i32 30, ; 515
	i32 265, ; 516
	i32 57, ; 517
	i32 134, ; 518
	i32 114, ; 519
	i32 319, ; 520
	i32 372, ; 521
	i32 178, ; 522
	i32 177, ; 523
	i32 330, ; 524
	i32 55, ; 525
	i32 220, ; 526
	i32 6, ; 527
	i32 77, ; 528
	i32 240, ; 529
	i32 275, ; 530
	i32 333, ; 531
	i32 354, ; 532
	i32 111, ; 533
	i32 201, ; 534
	i32 279, ; 535
	i32 102, ; 536
	i32 192, ; 537
	i32 380, ; 538
	i32 189, ; 539
	i32 170, ; 540
	i32 115, ; 541
	i32 342, ; 542
	i32 314, ; 543
	i32 374, ; 544
	i32 269, ; 545
	i32 76, ; 546
	i32 325, ; 547
	i32 85, ; 548
	i32 327, ; 549
	i32 261, ; 550
	i32 363, ; 551
	i32 304, ; 552
	i32 160, ; 553
	i32 2, ; 554
	i32 275, ; 555
	i32 24, ; 556
	i32 254, ; 557
	i32 32, ; 558
	i32 117, ; 559
	i32 37, ; 560
	i32 16, ; 561
	i32 52, ; 562
	i32 328, ; 563
	i32 246, ; 564
	i32 243, ; 565
	i32 20, ; 566
	i32 123, ; 567
	i32 154, ; 568
	i32 214, ; 569
	i32 282, ; 570
	i32 242, ; 571
	i32 131, ; 572
	i32 264, ; 573
	i32 148, ; 574
	i32 204, ; 575
	i32 250, ; 576
	i32 120, ; 577
	i32 28, ; 578
	i32 132, ; 579
	i32 100, ; 580
	i32 134, ; 581
	i32 302, ; 582
	i32 153, ; 583
	i32 97, ; 584
	i32 125, ; 585
	i32 251, ; 586
	i32 69, ; 587
	i32 356, ; 588
	i32 72, ; 589
	i32 357, ; 590
	i32 287, ; 591
	i32 365, ; 592
	i32 305, ; 593
	i32 136, ; 594
	i32 174, ; 595
	i32 124, ; 596
	i32 71, ; 597
	i32 335, ; 598
	i32 111, ; 599
	i32 297, ; 600
	i32 187, ; 601
	i32 212, ; 602
	i32 152, ; 603
	i32 349, ; 604
	i32 348, ; 605
	i32 365, ; 606
	i32 325, ; 607
	i32 118, ; 608
	i32 273, ; 609
	i32 369, ; 610
	i32 200, ; 611
	i32 333, ; 612
	i32 127, ; 613
	i32 201, ; 614
	i32 133, ; 615
	i32 213, ; 616
	i32 77, ; 617
	i32 46, ; 618
	i32 276, ; 619
	i32 73, ; 620
	i32 63, ; 621
	i32 98, ; 622
	i32 84, ; 623
	i32 350, ; 624
	i32 43, ; 625
	i32 61, ; 626
	i32 221, ; 627
	i32 179, ; 628
	i32 303, ; 629
	i32 355, ; 630
	i32 211, ; 631
	i32 37, ; 632
	i32 40, ; 633
	i32 266, ; 634
	i32 331, ; 635
	i32 160, ; 636
	i32 98, ; 637
	i32 271, ; 638
	i32 213, ; 639
	i32 135, ; 640
	i32 20, ; 641
	i32 65, ; 642
	i32 337, ; 643
	i32 125, ; 644
	i32 75, ; 645
	i32 295, ; 646
	i32 164, ; 647
	i32 214, ; 648
	i32 156, ; 649
	i32 5, ; 650
	i32 49, ; 651
	i32 309, ; 652
	i32 338, ; 653
	i32 144, ; 654
	i32 369, ; 655
	i32 139, ; 656
	i32 100, ; 657
	i32 225, ; 658
	i32 123, ; 659
	i32 120, ; 660
	i32 371, ; 661
	i32 142, ; 662
	i32 39, ; 663
	i32 68, ; 664
	i32 218, ; 665
	i32 41, ; 666
	i32 357, ; 667
	i32 164, ; 668
	i32 73, ; 669
	i32 351, ; 670
	i32 165, ; 671
	i32 216, ; 672
	i32 234, ; 673
	i32 127, ; 674
	i32 281, ; 675
	i32 330, ; 676
	i32 68, ; 677
	i32 169, ; 678
	i32 294, ; 679
	i32 268, ; 680
	i32 175, ; 681
	i32 230, ; 682
	i32 301, ; 683
	i32 151, ; 684
	i32 45, ; 685
	i32 108, ; 686
	i32 195, ; 687
	i32 237, ; 688
	i32 48, ; 689
	i32 96, ; 690
	i32 31, ; 691
	i32 186, ; 692
	i32 350, ; 693
	i32 23, ; 694
	i32 166, ; 695
	i32 22, ; 696
	i32 198, ; 697
	i32 138, ; 698
	i32 78, ; 699
	i32 358, ; 700
	i32 54, ; 701
	i32 294, ; 702
	i32 299, ; 703
	i32 10, ; 704
	i32 256, ; 705
	i32 298, ; 706
	i32 285, ; 707
	i32 16, ; 708
	i32 139, ; 709
	i32 224, ; 710
	i32 13, ; 711
	i32 15, ; 712
	i32 122, ; 713
	i32 353, ; 714
	i32 87, ; 715
	i32 149, ; 716
	i32 22, ; 717
	i32 343, ; 718
	i32 34, ; 719
	i32 79, ; 720
	i32 343, ; 721
	i32 377, ; 722
	i32 323, ; 723
	i32 147, ; 724
	i32 80, ; 725
	i32 341, ; 726
	i32 200, ; 727
	i32 249, ; 728
	i32 353, ; 729
	i32 42, ; 730
	i32 26, ; 731
	i32 296, ; 732
	i32 293, ; 733
	i32 107, ; 734
	i32 110, ; 735
	i32 223, ; 736
	i32 344, ; 737
	i32 7, ; 738
	i32 326, ; 739
	i32 44, ; 740
	i32 337, ; 741
	i32 180, ; 742
	i32 161, ; 743
	i32 208, ; 744
	i32 148, ; 745
	i32 368, ; 746
	i32 261, ; 747
	i32 298, ; 748
	i32 38, ; 749
	i32 15, ; 750
	i32 244, ; 751
	i32 146, ; 752
	i32 8, ; 753
	i32 279, ; 754
	i32 300, ; 755
	i32 130, ; 756
	i32 347, ; 757
	i32 346, ; 758
	i32 342, ; 759
	i32 238, ; 760
	i32 316, ; 761
	i32 245, ; 762
	i32 94 ; 763
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ af27162bee43b7fecdca59b4f67aa8c175cbc875"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
