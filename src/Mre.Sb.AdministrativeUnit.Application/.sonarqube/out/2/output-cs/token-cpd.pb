”
hD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\AdministrativeUnitDbProperties.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
{ 
public 

static 
class ,
 UnidadAdministrativaDbProperties 8
{ 
public 
static 
string 
DbTablePrefix *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
=9 :
$str; =
;= >
public 
static 
string 
DbSchema %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
=4 5
null6 :
;: ;
public		 
const		 
string		  
ConnectionStringName		 0
=		1 2
$str		3 I
;		I J
}

 
} ©
hD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\AdministrativeUnitDomainModule.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
{ 
[ 
	DependsOn 
( 
typeof 
( 
AbpDddDomainModule !
)! "
," #
typeof 
( 0
$AdministrativeUnitDomainSharedModule 3
)3 4
)		 
]		 
public

 

class

 *
AdministrativeUnitDomainModule

 /
:

0 1
	AbpModule

2 ;
{ 
} 
} Õ%
YD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Arancel\Arancel.cs
	namespace		 	
Mre		
 
.		 
Sb		 
.		  
UnidadAdministrativa		 %
.		% &
Dominio		& -
{

 
public 

class 
Arancel 
:  
AuditedAggregateRoot /
</ 0
Guid0 4
>4 5
{ 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( ) 
MaxDescriptionLength) =
)= >
]> ?
public 
virtual 
string 
Descripcion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
[ 	
Required	 
] 
public 
string 
MonedaId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
Moneda 
Moneda 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
Required	 
] 
public 
bool 
Activo 
{ 
get  
;  !
	protected" +
set, /
;/ 0
}1 2
public 
virtual 
ICollection "
<" # 
JerarquiaArancelaria# 7
>7 8

Jerarquias9 C
{D E
getF I
;I J
	protectedK T
setU X
;X Y
}Z [
	protected!! 
Arancel!! 
(!! 
)!! 
{"" 	

Jerarquias## 
=## 
new## 
List## !
<##! " 
JerarquiaArancelaria##" 6
>##6 7
(##7 8
)##8 9
;##9 :
}$$ 	
public&& 
Arancel&& 
(&& 
Guid&& 
id&& 
,&& 
string&&  &
descripcion&&' 2
,&&2 3
string&&4 :
monedaId&&; C
,&&C D
bool&&E I
activo&&J P
=&&Q R
true&&S W
)&&W X
{'' 	
Id(( 
=(( 
id(( 
;(( 
Descripcion)) 
=)) 
descripcion)) %
;))% &
MonedaId** 
=** 
monedaId** 
;**  
Activo++ 
=++ 
activo++ 
;++ 

Jerarquias-- 
=-- 
new-- 
List-- !
<--! " 
JerarquiaArancelaria--" 6
>--6 7
(--7 8
)--8 9
;--9 :
}.. 	
public00 
void00 
CambiarDescripcion00 &
(00& '
string00' -
nuevaDescripcion00. >
)00> ?
{11 	
this22 
.22 
Descripcion22 
=22 
nuevaDescripcion22 /
;22/ 0
}33 	
public55 
void55 
CambiarEstadoActivo55 '
(55' (
bool55( ,
activo55- 3
)553 4
{66 	
this77 
.77 
Activo77 
=77 
activo77  
;77  !
}88 	
public>> 
void>> 
AgregarJerarquia>> $
(>>$ %
Guid>>% )
id>>* ,
,>>, -
string>>. 4
tipoArancelId>>5 B
,>>B C
string>>D J
descripcion>>K V
,>>V W
int>>X [
orden>>\ a
,>>a b
int>>c f
numeroJerarquia>>g v
)>>v w
{?? 	
Check@@ 
.@@ 
NotNull@@ 
(@@ 
id@@ 
,@@ 
nameof@@ $
(@@$ %
id@@% '
)@@' (
)@@( )
;@@) *

JerarquiasBB 
.BB 
AddBB 
(BB 
newBB  
JerarquiaArancelariaBB 3
(BB3 4
idBB4 6
,BB6 7
thisBB8 <
.BB< =
IdBB= ?
,BB? @
tipoArancelIdBBA N
,BBN O
descripcionBBP [
,BB[ \
ordenBB] b
,BBb c
numeroJerarquiaBBd s
)BBs t
)BBt u
;BBu v
}CC 	
publicFF 
voidFF 
QuitarJerarquiaFF #
(FF# $
GuidFF$ ("
jerarquiaArancelariaIdFF) ?
)FF? @
{GG 	

JerarquiasHH 
.HH 
	RemoveAllHH  
(HH  !
sHH! "
=>HH# %
sHH& '
.HH' (
IdHH( *
==HH+ -"
jerarquiaArancelariaIdHH. D
)HHD E
;HHE F
}JJ 	
}MM 
}NN ëh
`D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Arancel\ArancelManager.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

class 
ArancelManager 
:  !
DomainService" /
{ 
private 
readonly 
IStringLocalizer )
<) *&
AdministrativeUnitResource* D
>D E
	localizerF O
;O P
private 
readonly 
IRepository $
<$ %
Arancel% ,
,, -
Guid. 2
>2 3

repository4 >
;> ?
private 
readonly 
IRepository $
<$ % 
JerarquiaArancelaria% 9
>9 :*
jerarquiaArancelariaRepository; Y
;Y Z
public 
ArancelManager 
( 
IRepository )
<) *
Arancel* 1
,1 2
Guid3 7
>7 8

repository9 C
,C D
IRepository 
<  
JerarquiaArancelaria ,
>, -*
jerarquiaArancelariaRepository. L
,L M
IStringLocalizer 
< &
AdministrativeUnitResource 7
>7 8
	localizer9 B
)B C
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. *
jerarquiaArancelariaRepository /
=0 1*
jerarquiaArancelariaRepository2 P
;P Q
this 
. 
	localizer 
= 
	localizer &
;& '
}   	
public"" 
virtual"" 
async"" 
Task"" !
<""! "
Arancel""" )
>"") *
CreateAsync""+ 6
(""6 7
Guid""7 ;
id""< >
,""> ?
string""@ F
description""G R
,""R S
string""T Z

currencyId""[ e
,""e f
bool""g k
isActive""l t
=""u v
true""w {
)""{ |
{## 	
var%% 
	queryable%% 
=%% 
await%% !

repository%%" ,
.%%, -
GetQueryableAsync%%- >
(%%> ?
)%%? @
;%%@ A
var&& 
existingDescription&& #
=&&$ %
	queryable&&& /
.&&/ 0
Any&&0 3
(&&3 4
a&&4 5
=>&&6 8
a&&9 :
.&&: ;
Descripcion&&; F
.&&F G
ToUpper&&G N
(&&N O
)&&O P
==&&Q S
description&&T _
.&&_ `
ToUpper&&` g
(&&g h
)&&h i
)&&i j
;&&j k
if(( 
((( 
existingDescription(( #
)((# $
{)) 
throw++ 
new++ 
AbpException++ &
(++& '
string++' -
.++- .
Format++. 4
(++4 5
	localizer++5 >
[++> ?
$str++? Y
]++Y Z
,++Z [
description++\ g
)++g h
)++h i
;++i j
},, 
var.. 
entity.. 
=.. 
new.. 
Arancel.. $
(..$ %
id..% '
:..' (
id..) +
,..+ ,
descripcion..- 8
:..8 9
description..: E
,..E F
monedaId..G O
:..O P

currencyId..Q [
,..[ \
activo..] c
:..c d
isActive..e m
)..m n
;..n o
return00 
entity00 
;00 
}11 	
public33 
async33 
Task33 "
ChangeDescriptionAsync33 0
(330 1
Arancel44 
tariff44 
,44 
string55 
newDescription55 $
)55$ %
{66 	
Check77 
.77 
NotNull77 
(77 
tariff77  
,77  !
nameof77" (
(77( )
tariff77) /
)77/ 0
)770 1
;771 2
Check88 
.88 
NotNullOrWhiteSpace88 %
(88% &
newDescription88& 4
,884 5
nameof886 <
(88< =
newDescription88= K
)88K L
)88L M
;88M N
var:: 
	queryable:: 
=:: 
await:: !

repository::" ,
.::, -
GetQueryableAsync::- >
(::> ?
)::? @
;::@ A
var;; 
existingDescription;; #
=;;$ %
	queryable;;& /
.;;/ 0
Any;;0 3
(;;3 4
a;;4 5
=>;;6 8
a;;9 :
.;;: ;
Descripcion;;; F
.;;F G
ToUpper;;G N
(;;N O
);;O P
==;;Q S
newDescription;;T b
);;b c
;;;c d
if== 
(== 
existingDescription== #
)==# $
{>> 
throw@@ 
new@@ 
AbpException@@ &
(@@& '
string@@' -
.@@- .
Format@@. 4
(@@4 5
	localizer@@5 >
[@@> ?
$str@@? Y
]@@Y Z
,@@Z [
newDescription@@\ j
)@@j k
)@@k l
;@@l m
}AA 
tariffCC 
.CC 
CambiarDescripcionCC %
(CC% &
newDescriptionCC& 4
)CC4 5
;CC5 6
}DD 	
publicFF 
asyncFF 
TaskFF 
<FF 
ArancelFF !
>FF! "
ChangeStateAsyncFF# 3
(FF3 4
GuidFF4 8
idFF9 ;
,FF; <
boolFF= A
isActiveFFB J
)FFJ K
{GG 	
CheckHH 
.HH 
NotNullHH 
(HH 
idHH 
,HH 
nameofHH $
(HH$ %
idHH% '
)HH' (
)HH( )
;HH) *
varJJ 
tariffJJ 
=JJ 
awaitJJ 

repositoryJJ )
.JJ) *
GetAsyncJJ* 2
(JJ2 3
idJJ3 5
)JJ5 6
;JJ6 7
tariffLL 
.LL 
CambiarEstadoActivoLL &
(LL& '
isActiveLL' /
)LL/ 0
;LL0 1
returnNN 
tariffNN 
;NN 
}OO 	
publicUU 
asyncUU 
TaskUU 
<UU  
JerarquiaArancelariaUU .
>UU. /*
CrearJerarquiaArancelariaAsyncUU0 N
(UUN O
GuidUUO S
idUUT V
,UUV W
GuidUUX \
	arancelIdUU] f
,UUf g
stringUUh n
tipoArancelIdUUo |
,UU| }
string	UU~ Ñ
descripcion
UUÖ ê
,
UUê ë
int
UUí ï
orden
UUñ õ
,
UUõ ú
int
UUù †
numeroJerarquia
UU° ∞
)
UU∞ ±
{VV 	
CheckWW 
.WW 
NotNullWW 
(WW 
idWW 
,WW 
nameofWW $
(WW$ %
idWW% '
)WW' (
)WW( )
;WW) *
CheckXX 
.XX 
NotNullXX 
(XX 
	arancelIdXX #
,XX# $
nameofXX% +
(XX+ ,
	arancelIdXX, 5
)XX5 6
)XX6 7
;XX7 8
var[[ 
entity[[ 
=[[ 
new[[  
JerarquiaArancelaria[[ 1
([[1 2
id[[2 4
:[[4 5
id[[6 8
,[[8 9
	arancelId[[: C
:[[C D
	arancelId[[E N
,[[N O
tipoArancelId[[P ]
:[[] ^
tipoArancelId[[_ l
,[[l m
descripcion[[n y
:[[y z
descripcion	[[{ Ü
,
[[Ü á
orden
[[à ç
:
[[ç é
orden
[[è î
,
[[î ï
numeroJerarquia
[[ñ •
:
[[• ¶
numeroJerarquia
[[ß ∂
)
[[∂ ∑
;
[[∑ ∏
return]] 
entity]] 
;]] 
}__ 	
publicbb 
asyncbb 
Taskbb 
<bb 
Arancelbb !
>bb! ",
 AgregarJerarquiaArancelariaAsyncbb# C
(bbC D 
JerarquiaArancelariabbD X 
jerarquiaArancelariabbY m
)bbm n
{cc 	
varee 
	queryableee 
=ee 
awaitee !

repositoryee" ,
.ee, -
GetQueryableAsyncee- >
(ee> ?
)ee? @
;ee@ A
varff 
queryff 
=ff 
	queryableff !
.ff! "
Whereff" '
(ff' (
aff( )
=>ff* ,
aff- .
.ff. /
Idff/ 1
==ff2 4 
jerarquiaArancelariaff5 I
.ffI J
	ArancelIdffJ S
)ffS T
;ffT U
varhh 
arancelhh 
=hh 
awaithh 
AsyncExecuterhh  -
.hh- .
FirstOrDefaultAsynchh. A
(hhA B
queryhhB G
)hhG H
;hhH I
ifii 
(ii 
arancelii 
==ii 
nullii 
)ii  
{jj 
throwkk 
newkk #
EntityNotFoundExceptionkk 1
(kk1 2
typeofkk2 8
(kk8 9
Mrekk9 <
.kk< =
Sbkk= ?
.kk? @ 
UnidadAdministrativakk@ T
.kkT U
DominiokkU \
.kk\ ]
Arancelkk] d
)kkd e
,kke f 
jerarquiaArancelariakkg {
.kk{ |
	ArancelId	kk| Ö
)
kkÖ Ü
;
kkÜ á
}ll 
arancelvv 
.vv 
AgregarJerarquiavv $
(vv$ % 
jerarquiaArancelariavv% 9
.vv9 :
Idvv: <
,vv< = 
jerarquiaArancelariavv> R
.vvR S
TipoArancelIdvvS `
,vv` a 
jerarquiaArancelariavvb v
.vvv w
Descripcion	vvw Ç
,
vvÇ É"
jerarquiaArancelaria
vvÑ ò
.
vvò ô
Orden
vvô û
,
vvû ü"
jerarquiaArancelaria
vv† ¥
.
vv¥ µ
NumeroJerarquia
vvµ ƒ
)
vvƒ ≈
;
vv≈ ∆
returnxx 
arancelxx 
;xx 
}zz 	
public|| 
async|| 
Task|| 
<|| 
Arancel|| !
>||! "+
QuitarJerarquiaArancelariaAsync||# B
(||B C
Guid||C G
	arancelId||H Q
,||Q R
Guid||S W
jerarquiaId||X c
)||c d
{}} 	
Check~~ 
.~~ 
NotNull~~ 
(~~ 
	arancelId~~ #
,~~# $
nameof~~% +
(~~+ ,
	arancelId~~, 5
)~~5 6
)~~6 7
;~~7 8
Check 
. 
NotNull 
( 
jerarquiaId %
,% &
nameof' -
(- .
jerarquiaId. 9
)9 :
): ;
;; <
var
ÅÅ !
queryableJerarquias
ÅÅ #
=
ÅÅ$ %
await
ÅÅ& +,
jerarquiaArancelariaRepository
ÅÅ, J
.
ÅÅJ K
GetQueryableAsync
ÅÅK \
(
ÅÅ\ ]
)
ÅÅ] ^
;
ÅÅ^ _!
queryableJerarquias
ÉÉ 
=
ÉÉ  !!
queryableJerarquias
ÉÉ" 5
.
ÉÉ5 6
Where
ÉÉ6 ;
(
ÉÉ; <
s
ÉÉ< =
=>
ÉÉ> @
s
ÉÉA B
.
ÉÉB C
	ArancelId
ÉÉC L
==
ÉÉM O
	arancelId
ÉÉP Y
&&
ÉÉZ \
s
ÉÉ] ^
.
ÉÉ^ _
Id
ÉÉ_ a
==
ÉÉb d
jerarquiaId
ÉÉe p
)
ÉÉp q
;
ÉÉq r
var
ÖÖ 
	jerarquia
ÖÖ 
=
ÖÖ 
await
ÖÖ !
AsyncExecuter
ÖÖ" /
.
ÖÖ/ 0!
FirstOrDefaultAsync
ÖÖ0 C
(
ÖÖC D!
queryableJerarquias
ÖÖD W
)
ÖÖW X
;
ÖÖX Y
if
áá 
(
áá 
	jerarquia
áá 
==
áá 
null
áá !
)
áá! "
{
àà 
throw
ââ 
new
ââ %
EntityNotFoundException
ââ 1
(
ââ1 2
typeof
ââ2 8
(
ââ8 9"
JerarquiaArancelaria
ââ9 M
)
ââM N
,
ââN O
jerarquiaId
ââP [
)
ââ[ \
;
ââ\ ]
}
ää 
var
åå 
	queryable
åå 
=
åå 
await
åå !

repository
åå" ,
.
åå, -
GetQueryableAsync
åå- >
(
åå> ?
)
åå? @
;
åå@ A
var
çç 
query
çç 
=
çç 
	queryable
çç !
.
çç! "
Where
çç" '
(
çç' (
a
çç( )
=>
çç* ,
a
çç- .
.
çç. /
Id
çç/ 1
==
çç2 4
	arancelId
çç5 >
)
çç> ?
;
çç? @
var
èè 
arancel
èè 
=
èè 
await
èè 
AsyncExecuter
èè  -
.
èè- .!
FirstOrDefaultAsync
èè. A
(
èèA B
query
èèB G
)
èèG H
;
èèH I
arancel
ëë 
.
ëë 
QuitarJerarquia
ëë #
(
ëë# $
jerarquiaId
ëë$ /
)
ëë/ 0
;
ëë0 1
return
ìì 
arancel
ìì 
;
ìì 
}
îî 	
}
óó 
}öö Õ)
fD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Arancel\JerarquiaArancelaria.cs
	namespace

 	
Mre


 
.

 
Sb

 
.

  
UnidadAdministrativa

 %
.

% &
Dominio

& -
{ 
public 

class  
JerarquiaArancelaria %
:& ' 
AuditedAggregateRoot( <
<< =
Guid= A
>A B
{ 
[ 	
Required	 
] 
public 
Guid 
	ArancelId 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Required	 
] 
public 
string 
TipoArancelId #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
TipoArancel 
TipoArancel &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( ) 
MaxDescriptionLength) =
)= >
]> ?
public 
virtual 
string 
Descripcion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
[   	
Required  	 
]   
public!! 
virtual!! 
int!! 
Orden!!  
{!!! "
get!!# &
;!!& '
set!!( +
;!!+ ,
}!!- .
public## 
virtual## 
int## 
NumeroJerarquia## *
{##+ ,
get##- 0
;##0 1
set##2 5
;##5 6
}##7 8
public&& 
virtual&& 
ICollection&& "
<&&" #
PartidaArancelaria&&# 5
>&&5 6
Partidas&&7 ?
{&&@ A
get&&B E
;&&E F
	protected&&G P
set&&Q T
;&&T U
}&&V W
	protected))  
JerarquiaArancelaria)) &
())& '
)))' (
{** 	
Partidas++ 
=++ 
new++ 
List++ 
<++  
PartidaArancelaria++  2
>++2 3
(++3 4
)++4 5
;++5 6
},, 	
public..  
JerarquiaArancelaria.. #
(..# $
Guid..$ (
id..) +
,..+ ,
Guid..- 1
	arancelId..2 ;
,..; <
string..= C
tipoArancelId..D Q
,..Q R
string..S Y
descripcion..Z e
,..e f
int..g j
orden..k p
,..p q
int..r u
numeroJerarquia	..v Ö
)
..Ö Ü
{// 	
Id00 
=00 
id00 
;00 
	ArancelId11 
=11 
	arancelId11 !
;11! "
TipoArancelId22 
=22 
tipoArancelId22 )
;22) *
Descripcion33 
=33 
descripcion33 %
;33% &
Orden44 
=44 
orden44 
;44 
NumeroJerarquia55 
=55 
numeroJerarquia55 -
;55- .
Partidas77 
=77 
new77 
List77 
<77  
PartidaArancelaria77  2
>772 3
(773 4
)774 5
;775 6
}88 	
public;; 
void;; 
CambiarDescripcion;; &
(;;& '
string;;' -
nuevaDescripcion;;. >
);;> ?
{<< 	
this== 
.== 
Descripcion== 
=== 
nuevaDescripcion== /
;==/ 0
}>> 	
publicCC 
voidCC 
AgregarPartidaCC "
(CC" #
GuidCC# '
idCC( *
,CC* +
stringCC, 2
descripcionCC3 >
,CC> ?
stringCC@ F
numeroPartidaCCG T
,CCT U
decimalCCV ]
valorCC^ c
)CCc d
{DD 	
CheckEE 
.EE 
NotNullEE 
(EE 
idEE 
,EE 
nameofEE $
(EE$ %
idEE% '
)EE' (
)EE( )
;EE) *
PartidasGG 
.GG 
AddGG 
(GG 
newGG 
PartidaArancelariaGG /
(GG/ 0
idGG0 2
:GG2 3
idGG4 6
,GG6 7"
jerarquiaArancelariaIdHH &
:HH& '
thisHH( ,
.HH, -
IdHH- /
,HH/ 0
descripcionII 
:II 
descripcionII (
,II( )
numeroPartidaJJ 
:JJ 
numeroPartidaJJ ,
,JJ, -
valorKK 
:KK 
valorKK 
)KK 
)KK 
;KK 
}LL 	
publicOO 
voidOO 
QuitarPartidaOO !
(OO! "
GuidOO" & 
partidaArancelariaIdOO' ;
)OO; <
{PP 	
PartidasQQ 
.QQ 
	RemoveAllQQ 
(QQ 
sQQ  
=>QQ! #
sQQ$ %
.QQ% &
IdQQ& (
==QQ) + 
partidaArancelariaIdQQ, @
)QQ@ A
;QQA B
}SS 	
}VV 
}WW Âb
mD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Arancel\JerarquiaArancelariaManager.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

class '
JerarquiaArancelariaManager ,
:- .
DomainService/ <
{ 
private 
readonly 
IStringLocalizer )
<) *&
AdministrativeUnitResource* D
>D E
	localizerF O
;O P
private 
readonly 
IRepository $
<$ % 
JerarquiaArancelaria% 9
,9 :
Guid; ?
>? @

repositoryA K
;K L
private 
readonly 
IRepository $
<$ %
PartidaArancelaria% 7
>7 8(
partidaArancelariaRepository9 U
;U V
public '
JerarquiaArancelariaManager *
(* +
IRepository+ 6
<6 7 
JerarquiaArancelaria7 K
,K L
GuidM Q
>Q R

repositoryS ]
,] ^
IRepository 
< 
PartidaArancelaria *
>* +(
partidaArancelariaRepository, H
,H I
IStringLocalizer 
< &
AdministrativeUnitResource 7
>7 8
	localizer9 B
)B C
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. (
partidaArancelariaRepository -
=. /(
partidaArancelariaRepository0 L
;L M
this 
. 
	localizer 
= 
	localizer &
;& '
}   	
public"" 
virtual"" 
async"" 
Task"" !
<""! " 
JerarquiaArancelaria""" 6
>""6 7
CreateAsync""8 C
(""C D
Guid""D H
id""I K
,""K L
Guid""M Q
tariffId""R Z
,""Z [
string""\ b
tariffTypeId""c o
,""o p
string""q w
description	""x É
,
""É Ñ
int
""Ö à
order
""â é
,
""é è
int
""ê ì
hierarchyNumber
""î £
)
""£ §
{## 	
var%% 
	queryable%% 
=%% 
await%% !

repository%%" ,
.%%, -
GetQueryableAsync%%- >
(%%> ?
)%%? @
;%%@ A
var&& 
existingDescription&& #
=&&$ %
	queryable&&& /
.&&/ 0
Any&&0 3
(&&3 4
a&&4 5
=>&&6 8
a&&9 :
.&&: ;
Descripcion&&; F
.&&F G
ToUpper&&G N
(&&N O
)&&O P
==&&Q S
description&&T _
.&&_ `
ToUpper&&` g
(&&g h
)&&h i
)&&i j
;&&j k
if(( 
((( 
existingDescription(( #
)((# $
{)) 
throw++ 
new++ 
AbpException++ &
(++& '
string++' -
.++- .
Format++. 4
(++4 5
	localizer++5 >
[++> ?
$str++? Y
]++Y Z
,++Z [
description++\ g
)++g h
)++h i
;++i j
},, 
var.. 
entity.. 
=.. 
new..  
JerarquiaArancelaria.. 1
(..1 2
id..2 4
:..4 5
id..6 8
,..8 9
	arancelId..: C
:..C D
tariffId..E M
,..M N
tipoArancelId..O \
:..\ ]
tariffTypeId..^ j
,..j k
descripcion..l w
:..w x
description	..y Ñ
,
..Ñ Ö
orden
..Ü ã
:
..ã å
order
..ç í
,
..í ì
numeroJerarquia
..î £
:
..£ §
hierarchyNumber
..• ¥
)
..¥ µ
;
..µ ∂
return00 
entity00 
;00 
}11 	
public33 
async33 
Task33 "
ChangeDescriptionAsync33 0
(330 1 
JerarquiaArancelaria44 #
tariffHierarchy44$ 3
,443 4
string55 
newDescription55 $
)55$ %
{66 	
Check77 
.77 
NotNull77 
(77 
tariffHierarchy77 )
,77) *
nameof77+ 1
(771 2
tariffHierarchy772 A
)77A B
)77B C
;77C D
Check88 
.88 
NotNullOrWhiteSpace88 %
(88% &
newDescription88& 4
,884 5
nameof886 <
(88< =
newDescription88= K
)88K L
)88L M
;88M N
var:: 
	queryable:: 
=:: 
await:: !

repository::" ,
.::, -
GetQueryableAsync::- >
(::> ?
)::? @
;::@ A
var;; 
existingDescription;; #
=;;$ %
	queryable;;& /
.;;/ 0
Any;;0 3
(;;3 4
a;;4 5
=>;;6 8
a;;9 :
.;;: ;
Descripcion;;; F
.;;F G
ToUpper;;G N
(;;N O
);;O P
==;;Q S
newDescription;;T b
);;b c
;;;c d
if== 
(== 
existingDescription== #
)==# $
{>> 
throw@@ 
new@@ 
AbpException@@ &
(@@& '
string@@' -
.@@- .
Format@@. 4
(@@4 5
	localizer@@5 >
[@@> ?
$str@@? Y
]@@Y Z
,@@Z [
newDescription@@\ j
)@@j k
)@@k l
;@@l m
}AA 
tariffHierarchyCC 
.CC 
CambiarDescripcionCC .
(CC. /
newDescriptionCC/ =
)CC= >
;CC> ?
}DD 	
publicII 
asyncII 
TaskII 
<II 
PartidaArancelariaII ,
>II, -(
CrearPartidaArancelariaAsyncII. J
(IIJ K
GuidIIK O
idIIP R
,IIR S
GuidIIT X"
jerarquiaArancelariaIdIIY o
,IIo p
stringIIq w
descripcion	IIx É
,
IIÉ Ñ
string
IIÖ ã
numeroPartida
IIå ô
,
IIô ö
decimal
IIõ ¢
valor
II£ ®
)
II® ©
{JJ 	
CheckKK 
.KK 
NotNullKK 
(KK 
idKK 
,KK 
nameofKK $
(KK$ %
idKK% '
)KK' (
)KK( )
;KK) *
CheckLL 
.LL 
NotNullLL 
(LL "
jerarquiaArancelariaIdLL 0
,LL0 1
nameofLL2 8
(LL8 9"
jerarquiaArancelariaIdLL9 O
)LLO P
)LLP Q
;LLQ R
varOO 
entityOO 
=OO 
newOO 
PartidaArancelariaOO /
(OO/ 0
idOO0 2
:OO2 3
idOO4 6
,OO6 7"
jerarquiaArancelariaIdOO8 N
:OON O"
jerarquiaArancelariaIdOOP f
,OOf g
descripcionOOh s
:OOs t
descripcion	OOu Ä
,
OOÄ Å
numeroPartida
OOÇ è
:
OOè ê
numeroPartida
OOë û
,
OOû ü
valor
OO† •
:
OO• ¶
valor
OOß ¨
)
OO¨ ≠
;
OO≠ Æ
returnQQ 
entityQQ 
;QQ 
}SS 	
publicVV 
asyncVV 
TaskVV 
<VV  
JerarquiaArancelariaVV .
>VV. /*
AgregarPartidaArancelariaAsyncVV0 N
(VVN O
PartidaArancelariaVVO a
partidaArancelariaVVb t
)VVt u
{WW 	
varYY 
	queryableYY 
=YY 
awaitYY !

repositoryYY" ,
.YY, -
GetQueryableAsyncYY- >
(YY> ?
)YY? @
;YY@ A
varZZ 
queryZZ 
=ZZ 
	queryableZZ !
.ZZ! "
WhereZZ" '
(ZZ' (
aZZ( )
=>ZZ* ,
aZZ- .
.ZZ. /
IdZZ/ 1
==ZZ2 4
partidaArancelariaZZ5 G
.ZZG H"
JerarquiaArancelariaIdZZH ^
)ZZ^ _
;ZZ_ `
var\\ 
	jerarquia\\ 
=\\ 
await\\ !
AsyncExecuter\\" /
.\\/ 0
FirstOrDefaultAsync\\0 C
(\\C D
query\\D I
)\\I J
;\\J K
if]] 
(]] 
	jerarquia]] 
==]] 
null]] !
)]]! "
{^^ 
throw__ 
new__ #
EntityNotFoundException__ 1
(__1 2
typeof__2 8
(__8 9
Mre__9 <
.__< =
Sb__= ?
.__? @ 
UnidadAdministrativa__@ T
.__T U
Dominio__U \
.__\ ] 
JerarquiaArancelaria__] q
)__q r
,__r s
partidaArancelaria	__t Ü
.
__Ü á$
JerarquiaArancelariaId
__á ù
)
__ù û
;
__û ü
}`` 
	jerarquiabb 
.bb 
AgregarPartidabb $
(bb$ %
partidaArancelariabb% 7
.bb7 8
Idbb8 :
,bb: ;
partidaArancelariabb< N
.bbN O
DescripcionbbO Z
,bbZ [
partidaArancelariabb\ n
.bbn o
NumeroPartidabbo |
,bb| }
partidaArancelaria	bb~ ê
.
bbê ë
Valor
bbë ñ
)
bbñ ó
;
bbó ò
returndd 
	jerarquiadd 
;dd 
}ff 	
publichh 
asynchh 
Taskhh 
<hh  
JerarquiaArancelariahh .
>hh. /)
QuitarPartidaArancelariaAsynchh0 M
(hhM N
GuidhhN R"
jerarquiaArancelariaIdhhS i
,hhi j
Guidhhk o!
partidaArancelariaId	hhp Ñ
)
hhÑ Ö
{ii 	
Checkjj 
.jj 
NotNulljj 
(jj "
jerarquiaArancelariaIdjj 0
,jj0 1
nameofjj2 8
(jj8 9"
jerarquiaArancelariaIdjj9 O
)jjO P
)jjP Q
;jjQ R
Checkkk 
.kk 
NotNullkk 
(kk  
partidaArancelariaIdkk .
,kk. /
nameofkk0 6
(kk6 7 
partidaArancelariaIdkk7 K
)kkK L
)kkL M
;kkM N
varmm 
queryablePartidasmm !
=mm" #
awaitmm$ )(
partidaArancelariaRepositorymm* F
.mmF G
GetQueryableAsyncmmG X
(mmX Y
)mmY Z
;mmZ [
queryablePartidasoo 
=oo 
queryablePartidasoo  1
.oo1 2
Whereoo2 7
(oo7 8
soo8 9
=>oo: <
soo= >
.oo> ?"
JerarquiaArancelariaIdoo? U
==ooV X"
jerarquiaArancelariaIdooY o
&&oop r
soos t
.oot u
Idoou w
==oox z!
partidaArancelariaId	oo{ è
)
ooè ê
;
ooê ë
varqq 
partidaqq 
=qq 
awaitqq 
AsyncExecuterqq  -
.qq- .
FirstOrDefaultAsyncqq. A
(qqA B
queryablePartidasqqB S
)qqS T
;qqT U
ifss 
(ss 
partidass 
==ss 
nullss 
)ss  
{tt 
throwuu 
newuu #
EntityNotFoundExceptionuu 1
(uu1 2
typeofuu2 8
(uu8 9
PartidaArancelariauu9 K
)uuK L
,uuL M 
partidaArancelariaIduuN b
)uub c
;uuc d
}vv 
varxx 
	queryablexx 
=xx 
awaitxx !

repositoryxx" ,
.xx, -
GetQueryableAsyncxx- >
(xx> ?
)xx? @
;xx@ A
varyy 
queryyy 
=yy 
	queryableyy !
.yy! "
Whereyy" '
(yy' (
ayy( )
=>yy* ,
ayy- .
.yy. /
Idyy/ 1
==yy2 4"
jerarquiaArancelariaIdyy5 K
)yyK L
;yyL M
var{{ 
	jerarquia{{ 
={{ 
await{{ !
AsyncExecuter{{" /
.{{/ 0
FirstOrDefaultAsync{{0 C
({{C D
query{{D I
){{I J
;{{J K
	jerarquia}} 
.}} 
QuitarPartida}} #
(}}# $ 
partidaArancelariaId}}$ 8
)}}8 9
;}}9 :
return 
	jerarquia 
; 
}
ÄÄ 	
}
ÉÉ 
}ÜÜ ‰"
dD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Arancel\PartidaArancelaria.cs
	namespace		 	
Mre		
 
.		 
Sb		 
.		  
UnidadAdministrativa		 %
.		% &
Dominio		& -
{

 
public 

class 
PartidaArancelaria #
:$ % 
AuditedAggregateRoot& :
<: ;
Guid; ?
>? @
{ 
[ 	
Required	 
] 
public 
Guid "
JerarquiaArancelariaId *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( ) 
MaxDescriptionLength) =
)= >
]> ?
public 
virtual 
string 
Descripcion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
[ 	
Required	 
] 
[ 	
StringLength	 
( 
TariffHeadingConsts )
.) */
#MaxTariffHeadingHeadingNumberLength* M
)M N
]N O
public 
virtual 
string 
NumeroPartida +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
[ 	
Required	 
] 
public 
virtual 
decimal 
Valor $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
virtual 
ICollection "
<" #&
PartidaArancelariaServicio# =
>= >
	Servicios? H
{I J
getK N
;N O
	protectedP Y
setZ ]
;] ^
}_ `
	protected!! 
PartidaArancelaria!! $
(!!$ %
)!!% &
{"" 	
}$$ 	
public%% 
PartidaArancelaria%% !
(%%! "
Guid%%" &
id%%' )
,%%) *
Guid%%+ /"
jerarquiaArancelariaId%%0 F
,%%F G
string%%H N
descripcion%%O Z
,%%Z [
string%%\ b
numeroPartida%%c p
,%%p q
decimal%%r y
valor%%z 
)	%% Ä
{&& 	
Id'' 
='' 
id'' 
;'' "
JerarquiaArancelariaId(( "
=((# $"
jerarquiaArancelariaId((% ;
;((; <
Descripcion)) 
=)) 
descripcion)) %
;))% &
NumeroPartida** 
=** 
numeroPartida** )
;**) *
Valor++ 
=++ 
valor++ 
;++ 
	Servicios-- 
=-- 
new-- 
List--  
<--  !&
PartidaArancelariaServicio--! ;
>--; <
(--< =
)--= >
;--> ?
}.. 	
public00 
void00 
ChangeDescription00 %
(00% &
string00& ,
nuevaDescripcion00- =
)00= >
{11 	
this22 
.22 
Descripcion22 
=22 
nuevaDescripcion22 /
;22/ 0
}33 	
public55 
void55 

AddService55 
(55 
Guid55 #
	serviceId55$ -
)55- .
{66 	
Check77 
.77 
NotNull77 
(77 
	serviceId77 #
,77# $
nameof77% +
(77+ ,
	serviceId77, 5
)775 6
)776 7
;777 8
	Servicios99 
.99 
Add99 
(99 
new99 &
PartidaArancelariaServicio99 8
(998 9
this999 =
.99= >
Id99> @
,99@ A
	serviceId99B K
)99K L
)99L M
;99M N
}:: 	
public<< 
void<< 
RemoveService<< !
(<<! "
Guid<<" &
	serviceId<<' 0
)<<0 1
{== 	
	Servicios>> 
.>> 
	RemoveAll>> 
(>>  
s>>  !
=>>>" $
s>>% &
.>>& '

ServicioId>>' 1
==>>2 4
	serviceId>>5 >
)>>> ?
;>>? @
}@@ 	
}AA 
}BB œd
kD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Arancel\PartidaArancelariaManager.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

class %
PartidaArancelariaManager *
:+ ,
DomainService- :
{ 
private 
readonly 
IStringLocalizer )
<) *&
AdministrativeUnitResource* D
>D E
	localizerF O
;O P
private 
readonly 
IRepository $
<$ %
PartidaArancelaria% 7
,7 8
Guid9 =
>= >

repository? I
;I J
private 
readonly 
IRepository $
<$ %&
PartidaArancelariaServicio% ?
>? @+
tariffHeadingServiceRespositoryA `
;` a
public %
PartidaArancelariaManager (
(( )
IRepository) 4
<4 5
PartidaArancelaria5 G
,G H
GuidI M
>M N

repositoryO Y
,Y Z
IStringLocalizer 
< &
AdministrativeUnitResource 7
>7 8
	localizer9 B
,B C
IRepository 
< &
PartidaArancelariaServicio 2
>2 3+
tariffHeadingServiceRespository4 S
)S T
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. +
tariffHeadingServiceRespository 0
=1 2+
tariffHeadingServiceRespository3 R
;R S
this 
. 
	localizer 
= 
	localizer &
;& '
}!! 	
public## 
virtual## 
async## 
Task## !
<##! "
PartidaArancelaria##" 4
>##4 5
CreateAsync##6 A
(##A B
Guid##B F
id##G I
,##I J
string##K Q
description##R ]
,##] ^
string##_ e
headingNumber##f s
,##s t
decimal##u |
value	##} Ç
,
##Ç É
Guid
##Ñ à
tariffHierarchyId
##â ö
)
##ö õ
{$$ 	
var&& 
	queryable&& 
=&& 
await&& !

repository&&" ,
.&&, -
GetQueryableAsync&&- >
(&&> ?
)&&? @
;&&@ A
var'' 
existingDescription'' #
=''$ %
	queryable''& /
.''/ 0
Any''0 3
(''3 4
a''4 5
=>''6 8
a''9 :
.'': ;
Descripcion''; F
.''F G
ToUpper''G N
(''N O
)''O P
==''Q S
description''T _
.''_ `
ToUpper''` g
(''g h
)''h i
)''i j
;''j k
if)) 
()) 
existingDescription)) #
)))# $
{** 
throw++ 
new++ !
UserFriendlyException++ /
(++/ 0
string++0 6
.++6 7
Format++7 =
(++= >
	localizer++> G
[++G H
$str++H h
]++h i
,++i j
description++k v
)++v w
)++w x
;++x y
},, 
var.. 
entity.. 
=.. 
new.. 
PartidaArancelaria.. /
(../ 0
id..0 2
:..2 3
id..4 6
,..6 7"
jerarquiaArancelariaId..8 N
:..N O
tariffHierarchyId..P a
,..a b
descripcion..c n
:..n o
description..p {
,..{ |
numeroPartida	..} ä
:
..ä ã
headingNumber
..å ô
,
..ô ö
valor
..õ †
:
..† °
value
..¢ ß
)
..ß ®
;
..® ©
return00 
entity00 
;00 
}11 	
public33 
async33 
Task33 "
ChangeDescriptionAsync33 0
(330 1
PartidaArancelaria44 !
TariffHeading44" /
,44/ 0
string55 
newDescription55 $
)55$ %
{66 	
Check77 
.77 
NotNull77 
(77 
TariffHeading77 '
,77' (
nameof77) /
(77/ 0
TariffHeading770 =
)77= >
)77> ?
;77? @
Check88 
.88 
NotNullOrWhiteSpace88 %
(88% &
newDescription88& 4
,884 5
nameof886 <
(88< =
newDescription88= K
)88K L
)88L M
;88M N
var:: 
	queryable:: 
=:: 
await:: !

repository::" ,
.::, -
GetQueryableAsync::- >
(::> ?
)::? @
;::@ A
var;; 
existingDescription;; #
=;;$ %
	queryable;;& /
.;;/ 0
Any;;0 3
(;;3 4
a;;4 5
=>;;6 8
a;;9 :
.;;: ;
Descripcion;;; F
.;;F G
ToUpper;;G N
(;;N O
);;O P
==;;Q S
newDescription;;T b
);;b c
;;;c d
if== 
(== 
existingDescription== #
)==# $
{>> 
throw?? 
new?? !
UserFriendlyException?? /
(??/ 0
string??0 6
.??6 7
Format??7 =
(??= >
	localizer??> G
[??G H
$str??H h
]??h i
,??i j
newDescription??k y
)??y z
)??z {
;??{ |
}@@ 
TariffHeadingBB 
.BB 
ChangeDescriptionBB +
(BB+ ,
newDescriptionBB, :
)BB: ;
;BB; <
}CC 	
publicEE 
asyncEE 
TaskEE 
<EE 
PartidaArancelariaEE ,
>EE, -
AddServiceAsyncEE. =
(EE= >
GuidEE> B
tariffHeadingIdEEC R
,EER S
GuidEET X
	serviceIdEEY b
)EEb c
{FF 	
CheckGG 
.GG 
NotNullGG 
(GG 
tariffHeadingIdGG )
,GG) *
nameofGG+ 1
(GG1 2
tariffHeadingIdGG2 A
)GGA B
)GGB C
;GGC D
CheckHH 
.HH 
NotNullHH 
(HH 
	serviceIdHH #
,HH# $
nameofHH% +
(HH+ ,
	serviceIdHH, 5
)HH5 6
)HH6 7
;HH7 8
varJJ 
	queryableJJ 
=JJ 
awaitJJ !

repositoryJJ" ,
.JJ, -
WithDetailsAsyncJJ- =
(JJ= >
tJJ> ?
=>JJ@ B
tJJC D
.JJD E
	ServiciosJJE N
)JJN O
;JJO P
varLL 
queryLL 
=LL 
	queryableLL !
.LL! "
WhereLL" '
(LL' (
tLL( )
=>LL* ,
tLL- .
.LL. /
IdLL/ 1
==LL2 4
tariffHeadingIdLL5 D
)LLD E
;LLE F
varNN 
tariffHeadingNN 
=NN 
awaitNN  %
AsyncExecuterNN& 3
.NN3 4
FirstOrDefaultAsyncNN4 G
(NNG H
queryNNH M
)NNM N
;NNN O
ifOO 
(OO 
tariffHeadingOO 
==OO  
nullOO! %
)OO% &
{PP 
throwQQ 
newQQ #
EntityNotFoundExceptionQQ 1
(QQ1 2
typeofQQ2 8
(QQ8 9
PartidaArancelariaQQ9 K
)QQK L
,QQL M
tariffHeadingIdQQN ]
)QQ] ^
;QQ^ _
}RR 
varTT 
existTT 
=TT 
awaitTT 
ExistServiceAsyncTT /
(TT/ 0
	serviceIdTT0 9
)TT9 :
;TT: ;
ifUU 
(UU 
existUU 
)UU 
{VV 
throwWW 
newWW !
UserFriendlyExceptionWW /
(WW/ 0
stringWW0 6
.WW6 7
FormatWW7 =
(WW= >
	localizerWW> G
[WWG H
$strWWH d
]WWd e
)WWe f
)WWf g
;WWg h
}XX 
tariffHeadingZZ 
.ZZ 

AddServiceZZ $
(ZZ$ %
	serviceIdZZ% .
)ZZ. /
;ZZ/ 0
return\\ 
tariffHeading\\  
;\\  !
}]] 	
private__ 
async__ 
Task__ 
<__ 
bool__ 
>__  
ExistServiceAsync__! 2
(__2 3
Guid__3 7
	serviceId__8 A
)__A B
{`` 	
Checkaa 
.aa 
NotNullaa 
(aa 
	serviceIdaa #
,aa# $
nameofaa% +
(aa+ ,
	serviceIdaa, 5
)aa5 6
)aa6 7
;aa7 8
varcc 
	queryablecc 
=cc 
awaitcc !+
tariffHeadingServiceRespositorycc" A
.ccA B
GetQueryableAsyncccB S
(ccS T
)ccT U
;ccU V
	queryabledd 
=dd 
	queryabledd !
.dd! "
Wheredd" '
(dd' (
pdd( )
=>dd* ,
pdd- .
.dd. /

ServicioIddd/ 9
==dd: <
	serviceIddd= F
)ddF G
;ddG H
returnff 
	queryableff 
.ff 
Anyff  
(ff  !
)ff! "
;ff" #
}gg 	
publicii 
asyncii 
Taskii 
<ii 
PartidaArancelariaii ,
>ii, -
RemoveServiceAsyncii. @
(ii@ A
GuidiiA E
tariffHeadingIdiiF U
,iiU V
GuidiiW [
	serviceIdii\ e
)iie f
{jj 	
Checkkk 
.kk 
NotNullkk 
(kk 
tariffHeadingIdkk )
,kk) *
nameofkk+ 1
(kk1 2
tariffHeadingIdkk2 A
)kkA B
)kkB C
;kkC D
Checkll 
.ll 
NotNullll 
(ll 
	serviceIdll #
,ll# $
nameofll% +
(ll+ ,
	serviceIdll, 5
)ll5 6
)ll6 7
;ll7 8
varnn )
queryableTariffHeadingServicenn -
=nn. /
awaitnn0 5+
tariffHeadingServiceRespositorynn6 U
.nnU V
GetQueryableAsyncnnV g
(nng h
)nnh i
;nni j)
queryableTariffHeadingServicepp )
=pp* +)
queryableTariffHeadingServicepp, I
.ppI J
WhereppJ O
(ppO P
tsppP R
=>ppS U
tsppV X
.ppX Y 
PartidaArancelariaIdppY m
==ppn p
tariffHeadingId	ppq Ä
)
ppÄ Å
;
ppÅ Ç)
queryableTariffHeadingServiceqq )
=qq* +)
queryableTariffHeadingServiceqq, I
.qqI J
WhereqqJ O
(qqO P
tsqqP R
=>qqS U
tsqqV X
.qqX Y

ServicioIdqqY c
==qqd f
	serviceIdqqg p
)qqp q
;qqq r
varss  
tariffHeadingServicess $
=ss% &
awaitss' ,
AsyncExecuterss- :
.ss: ;
FirstOrDefaultAsyncss; N
(ssN O)
queryableTariffHeadingServicessO l
)ssl m
;ssm n
ifuu 
(uu  
tariffHeadingServiceuu $
==uu% '
nulluu( ,
)uu, -
{vv 
throwww 
newww #
EntityNotFoundExceptionww 1
(ww1 2
typeofww2 8
(ww8 9&
PartidaArancelariaServicioww9 S
)wwS T
,wwT U
$"wwV X
{wwX Y
tariffHeadingIdwwY h
}wwh i
$strwwi l
{wwl m
	serviceIdwwm v
}wwv w
"www x
)wwx y
;wwy z
}xx 
varzz 
	queryablezz 
=zz 
awaitzz !

repositoryzz" ,
.zz, -
GetQueryableAsynczz- >
(zz> ?
)zz? @
;zz@ A
var{{ 
query{{ 
={{ 
	queryable{{ !
.{{! "
Where{{" '
({{' (
th{{( *
=>{{+ -
th{{. 0
.{{0 1
Id{{1 3
=={{4 6
tariffHeadingId{{7 F
){{F G
;{{G H
var}} 
tariffHeading}} 
=}} 
await}}  %
AsyncExecuter}}& 3
.}}3 4
FirstOrDefaultAsync}}4 G
(}}G H
query}}H M
)}}M N
;}}N O
tariffHeading 
. 
RemoveService '
(' (
	serviceId( 1
)1 2
;2 3
return
ÅÅ 
tariffHeading
ÅÅ  
;
ÅÅ  !
}
ÇÇ 	
}
ÑÑ 
}áá Ê
lD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Arancel\PartidaArancelariaServicio.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

class &
PartidaArancelariaServicio +
:, -
Entity. 4
{ 
	protected &
PartidaArancelariaServicio ,
(, -
)- .
{ 	
} 	
public &
PartidaArancelariaServicio )
() *
Guid* . 
partidaArancelariaId/ C
,C D
GuidE I

servicioIdJ T
)T U
{ 	 
PartidaArancelariaId  
=! " 
partidaArancelariaId# 7
;7 8

ServicioId 
= 

servicioId #
;# $
} 	
[ 	
Required	 
] 
public 
Guid  
PartidaArancelariaId (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
[ 	
Required	 
] 
public 
Guid 

ServicioId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public!! 
override!! 
object!! 
[!! 
]!!  
GetKeys!!! (
(!!( )
)!!) *
{"" 	
return## 
new## 
object## 
[## 
]## 
{##  ! 
PartidaArancelariaId##" 6
,##6 7

ServicioId##8 B
}##C D
;##D E
}$$ 	
}%% 
}&& “
]D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Arancel\TipoArancel.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public		 

class		 
TipoArancel		 
:		 
Entity		 %
<		% &
string		& ,
>		, -
{

 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
TariffTypeConsts &
.& '!
MaxTariffTypeIdLength' <
)< =
]= >
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @
Alfanumericos@ M
)M N
]N O
public 
override 
string 
Id !
{" #
get$ '
;' (
	protected) 2
set3 6
;6 7
}8 9
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxNameLength) 6
)6 7
]7 8
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @,
 AlfanumericosGuionesPuntoEspacio@ `
)` a
]a b
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
	protected 
TipoArancel 
( 
) 
{ 	
} 	
public 
TipoArancel 
( 
string !
id" $
)$ %
:	 

base 
( 
id 
) 
{ 	
} 	
} 
}   «
dD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Arancel\TipoArancelManager.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

class 
TipoArancelManager #
:$ %
DomainService& 3
{ 
private 
readonly 
IStringLocalizer )
<) *&
AdministrativeUnitResource* D
>D E
	localizerF O
;O P
private 
readonly 
IRepository $
<$ %
TipoArancel% 0
,0 1
string2 8
>8 9

repository: D
;D E
public 
TipoArancelManager !
(! "
IRepository" -
<- .
TipoArancel. 9
,9 :
string; A
>A B

repositoryC M
,M N
IStringLocalizer 
< &
AdministrativeUnitResource 7
>7 8
	localizer9 B
)B C
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
	localizer 
= 
	localizer &
;& '
} 	
public 
async 
Task 
ValidateCreateAsync -
(- .
string. 4
input5 :
): ;
{ 	
var   
exist   
=   
await   

repository   (
.  ( )
AnyAsync  ) 1
(  1 2
e  2 3
=>  4 6
e  7 8
.  8 9
Id  9 ;
.  ; <
ToUpper  < C
(  C D
)  D E
==  F H
input  I N
.  N O
ToUpper  O V
(  V W
)  W X
)  X Y
;  Y Z
if!! 
(!! 
exist!! 
)!! 
{"" 
var## 
msg## 
=## 
string##  
.##  !
Format##! '
(##' (
	localizer##( 1
[##1 2
$str##2 D
]##D E
,##E F
input##G L
)##L M
;##M N
throw$$ 
new$$ !
UserFriendlyException$$ /
($$/ 0
msg$$0 3
)$$3 4
;$$4 5
}%% 
}&& 	
}'' 
}** Æ%
[D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Convenio\Convenio.cs
	namespace		 	
Mre		
 
.		 
Sb		 
.		  
UnidadAdministrativa		 %
.		% &
Dominio		& -
{

 
public 

class 
Convenio 
:  
AuditedAggregateRoot 0
<0 1
Guid1 5
>5 6
{ 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( ) 
MaxDescriptionLength) =
)= >
]> ?
public 
virtual 
string 
Descripcion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
[ 	
Required	 
] 
public 
virtual 
DateTime 
FechaCreacion  -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
virtual 
DateTime 
?  
FechaExpiracion! 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
public 
virtual 
ICollection "
<" #
Exoneracion# .
>. /
Exoneraciones0 =
{> ?
get@ C
;C D
	protectedE N
setO R
;R S
}T U
	protected 
Convenio 
( 
) 
{ 	
}   	
public"" 
Convenio"" 
("" 
Guid"" 
id"" 
,""  
string""! '
description""( 3
,""3 4
DateTime""5 =
creationDate""> J
,""J K
DateTime""L T
?""T U
expirationDate""V d
)""d e
{## 	
Id$$ 
=$$ 
id$$ 
;$$ 
Descripcion%% 
=%% 
description%% %
;%%% &
FechaCreacion&& 
=&& 
creationDate&& (
;&&( )
FechaExpiracion'' 
='' 
expirationDate'' ,
;'', -
Exoneraciones)) 
=)) 
new)) 
List))  $
<))$ %
Exoneracion))% 0
>))0 1
())1 2
)))2 3
;))3 4
}** 	
public,, 
void,, 
ChangeDescription,, %
(,,% &
string,,& ,
newDescription,,- ;
),,; <
{-- 	
this.. 
... 
Descripcion.. 
=.. 
newDescription.. -
;..- .
}// 	
public11 
void11 
AddExoneration11 "
(11" #
Guid11# '
	serviceId11( 1
,111 2
decimal22 
value22 
,22 
string33 
tipoExoneracionId33 $
,33$ %
string44  
entidadAuspicianteId44 '
,44' (
string55 
paisId55 
,55 
int66 
?66 
edadInicial66 
,66 
int77 
?77 
	edadFinal77 
,77 
bool88 
?88 
discapacitado88 
)88  
{99 	
Check:: 
.:: 
NotNull:: 
(:: 
	serviceId:: #
,::# $
nameof::% +
(::+ ,
	serviceId::, 5
)::5 6
)::6 7
;::7 8
Check;; 
.;; 
NotNull;; 
(;; 
value;; 
,;;  
nameof;;! '
(;;' (
value;;( -
);;- .
);;. /
;;;/ 0
Exoneraciones== 
.== 
Add== 
(== 
new== !
Exoneracion==" -
(==- .
this==. 2
.==2 3
Id==3 5
,==5 6
	serviceId>> 
,>> 
value?? 
,?? 
tipoExoneracionId@@ !
,@@! " 
entidadAuspicianteIdAA $
,AA$ %
paisIdBB 
,BB 
edadInicialCC 
,CC 
	edadFinalDD 
,DD 
discapacitadoEE 
)EE 
)EE 
;EE  
}FF 	
publicHH 
voidHH 
RemoveExonerationHH %
(HH% &
GuidHH& *
	serviceIdHH+ 4
)HH4 5
{II 	
ExoneracionesJJ 
.JJ 
	RemoveAllJJ #
(JJ# $
sJJ$ %
=>JJ& (
sJJ) *
.JJ* +

ServicioIdJJ+ 5
==JJ6 8
	serviceIdJJ9 B
)JJB C
;JJC D
}LL 	
}MM 
}NN Ói
bD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Convenio\ConvenioManager.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

class 
ConvenioManager  
:! "
DomainService# 0
{ 
private 
readonly 
IStringLocalizer )
<) *&
AdministrativeUnitResource* D
>D E
	localizerF O
;O P
private 
readonly 
IRepository $
<$ %
Convenio% -
,- .
Guid/ 3
>3 4

repository5 ?
;? @
private 
readonly 
IRepository $
<$ %
Exoneracion% 0
>0 1!
exonerationRepository2 G
;G H
public 
ConvenioManager 
( 
IRepository *
<* +
Convenio+ 3
,3 4
Guid5 9
>9 :

repository; E
,E F
IRepository 
< 
Exoneracion #
># $!
exonerationRepository% :
,: ;
IStringLocalizer 
< &
AdministrativeUnitResource 7
>7 8
	localizer9 B
)B C
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. !
exonerationRepository &
=' (!
exonerationRepository) >
;> ?
this 
. 
	localizer 
= 
	localizer &
;& '
}   	
public"" 
virtual"" 
async"" 
Task"" !
<""! "
Convenio""" *
>""* +
CreateAsync"", 7
(""7 8
Guid""8 <
id""= ?
,""? @
string""A G
description""H S
,""S T
DateTime""U ]
creationDate""^ j
,""j k
DateTime""l t
?""t u
expirationDate	""v Ñ
)
""Ñ Ö
{## 	
var%% 
	queryable%% 
=%% 
await%% !

repository%%" ,
.%%, -
GetQueryableAsync%%- >
(%%> ?
)%%? @
;%%@ A
var&& 
existingDescription&& #
=&&$ %
	queryable&&& /
.&&/ 0
Any&&0 3
(&&3 4
a&&4 5
=>&&6 8
a&&9 :
.&&: ;
Descripcion&&; F
.&&F G
ToUpper&&G N
(&&N O
)&&O P
==&&Q S
description&&T _
.&&_ `
ToUpper&&` g
(&&g h
)&&h i
)&&i j
;&&j k
if(( 
((( 
existingDescription(( #
)((# $
{)) 
throw++ 
new++ !
UserFriendlyException++ /
(++/ 0
string++0 6
.++6 7
Format++7 =
(++= >
	localizer++> G
[++G H
$str++H b
]++b c
,++c d
description++e p
)++p q
)++q r
;++r s
},, 
var.. 
entity.. 
=.. 
new.. 
Convenio.. %
(..% &
id..& (
:..( )
id..* ,
,.., -
description... 9
:..9 :
description..; F
,..F G
creationDate..H T
:..T U
creationDate..V b
,..b c
expirationDate..d r
:..r s
expirationDate	..t Ç
)
..Ç É
;
..É Ñ
return00 
entity00 
;00 
}11 	
public33 
async33 
Task33 "
ChangeDescriptionAsync33 0
(330 1
Convenio44 
	Agreement44 !
,44! "
string55 
newDescription55 $
)55$ %
{66 	
Check77 
.77 
NotNull77 
(77 
	Agreement77 #
,77# $
nameof77% +
(77+ ,
	Agreement77, 5
)775 6
)776 7
;777 8
Check88 
.88 
NotNullOrWhiteSpace88 %
(88% &
newDescription88& 4
,884 5
nameof886 <
(88< =
newDescription88= K
)88K L
)88L M
;88M N
var:: 
	queryable:: 
=:: 
await:: !

repository::" ,
.::, -
GetQueryableAsync::- >
(::> ?
)::? @
;::@ A
var;; 
existingDescription;; #
=;;$ %
	queryable;;& /
.;;/ 0
Any;;0 3
(;;3 4
a;;4 5
=>;;6 8
a;;9 :
.;;: ;
Descripcion;;; F
.;;F G
ToUpper;;G N
(;;N O
);;O P
==;;Q S
newDescription;;T b
);;b c
;;;c d
if== 
(== 
existingDescription== #
)==# $
{>> 
throw@@ 
new@@ 
AbpException@@ &
(@@& '
string@@' -
.@@- .
Format@@. 4
(@@4 5
	localizer@@5 >
[@@> ?
$str@@? Y
]@@Y Z
,@@Z [
newDescription@@\ j
)@@j k
)@@k l
;@@l m
}AA 
	AgreementCC 
.CC 
ChangeDescriptionCC '
(CC' (
newDescriptionCC( 6
)CC6 7
;CC7 8
}DD 	
publicFF 
asyncFF 
TaskFF 
<FF 
ConvenioFF "
>FF" #
AddExonerationAsyncFF$ 7
(FF7 8
GuidFF8 <
idFF= ?
,FF? @
GuidGG 
	serviceIdGG 
,GG 
decimalHH 
valueHH 
,HH 
stringII 
tipoExoneracionIdII $
,II$ %
stringJJ  
entidadAuspicianteIdJJ '
,JJ' (
stringKK 
paisIdKK 
,KK 
intLL 
?LL 
edadInicialLL 
,LL 
intMM 
?MM 
	edadFinalMM 
,MM 
boolNN 
?NN 
discapacitadoNN 
)NN  
{OO 	
CheckPP 
.PP 
NotNullPP 
(PP 
idPP 
,PP 
nameofPP $
(PP$ %
idPP% '
)PP' (
)PP( )
;PP) *
CheckQQ 
.QQ 
NotNullQQ 
(QQ 
	serviceIdQQ #
,QQ# $
nameofQQ% +
(QQ+ ,
	serviceIdQQ, 5
)QQ5 6
)QQ6 7
;QQ7 8
varSS 
	queryableSS 
=SS 
awaitSS !

repositorySS" ,
.SS, -
WithDetailsAsyncSS- =
(SS= >
aSS> ?
=>SS@ B
aSSC D
.SSD E
ExoneracionesSSE R
)SSR S
;SSS T
varTT 
queryTT 
=TT 
	queryableTT !
.TT! "
WhereTT" '
(TT' (
auTT( *
=>TT+ -
auTT. 0
.TT0 1
IdTT1 3
==TT4 6
idTT7 9
)TT9 :
;TT: ;
varVV 
	agreementVV 
=VV 
awaitVV !
AsyncExecuterVV" /
.VV/ 0
FirstOrDefaultAsyncVV0 C
(VVC D
queryVVD I
)VVI J
;VVJ K
ifWW 
(WW 
	agreementWW 
==WW 
nullWW !
)WW! "
{XX 
throwYY 
newYY #
EntityNotFoundExceptionYY 1
(YY1 2
typeofYY2 8
(YY8 9
ConvenioYY9 A
)YYA B
,YYB C
idYYD F
)YYF G
;YYG H
}ZZ 
var]] 
exist]] 
=]] 
await]] !
ExistExonerationAsync]] 3
(]]3 4
id]]4 6
,]]6 7
	serviceId]]8 A
)]]A B
;]]B C
if^^ 
(^^ 
exist^^ 
)^^ 
{__ 
throw`` 
new`` !
UserFriendlyException`` /
(``/ 0
string``0 6
.``6 7
Format``7 =
(``= >
	localizer``> G
[``G H
$str``H i
]``i j
)``j k
)``k l
;``l m
}aa 
	agreementcc 
.cc 
AddExonerationcc $
(cc$ %
	serviceIddd 
,dd 
valueee 
,ee 
tipoExoneracionIdff !
,ff! " 
entidadAuspicianteIdgg $
,gg$ %
paisIdhh 
,hh 
edadInicialii 
,ii 
	edadFinaljj 
,jj 
discapacitadokk 
)kk 
;kk 
returnmm 
	agreementmm 
;mm 
}nn 	
publicpp 
asyncpp 
Taskpp 
<pp 
Conveniopp "
>pp" #"
RemoveExonerationAsyncpp$ :
(pp: ;
Guidpp; ?
idpp@ B
,ppB C
GuidppD H
	serviceIdppI R
)ppR S
{qq 	
Checkrr 
.rr 
NotNullrr 
(rr 
idrr 
,rr 
nameofrr $
(rr$ %
idrr% '
)rr' (
)rr( )
;rr) *
Checkss 
.ss 
NotNullss 
(ss 
	serviceIdss #
,ss# $
nameofss% +
(ss+ ,
	serviceIdss, 5
)ss5 6
)ss6 7
;ss7 8
varuu 
queryableServicesuu !
=uu" #
awaituu$ )!
exonerationRepositoryuu* ?
.uu? @
GetQueryableAsyncuu@ Q
(uuQ R
)uuR S
;uuS T
queryableServicesww 
=ww 
queryableServicesww  1
.ww1 2
Whereww2 7
(ww7 8
sww8 9
=>ww: <
sww= >
.ww> ?

ConvenioIdww? I
==wwJ L
idwwM O
&&wwP R
swwS T
.wwT U

ServicioIdwwU _
==ww` b
	serviceIdwwc l
)wwl m
;wwm n
varyy 
exonerationyy 
=yy 
awaityy #
AsyncExecuteryy$ 1
.yy1 2
FirstOrDefaultAsyncyy2 E
(yyE F
queryableServicesyyF W
)yyW X
;yyX Y
if{{ 
({{ 
exoneration{{ 
=={{ 
null{{ #
){{# $
{|| 
throw}} 
new}} #
EntityNotFoundException}} 1
(}}1 2
typeof}}2 8
(}}8 9
Exoneracion}}9 D
)}}D E
,}}E F
id}}G I
)}}I J
;}}J K
}~~ 
var
ÄÄ 
	queryable
ÄÄ 
=
ÄÄ 
await
ÄÄ !

repository
ÄÄ" ,
.
ÄÄ, -
GetQueryableAsync
ÄÄ- >
(
ÄÄ> ?
)
ÄÄ? @
;
ÄÄ@ A
var
ÅÅ 
query
ÅÅ 
=
ÅÅ 
	queryable
ÅÅ !
.
ÅÅ! "
Where
ÅÅ" '
(
ÅÅ' (
ua
ÅÅ( *
=>
ÅÅ+ -
ua
ÅÅ. 0
.
ÅÅ0 1
Id
ÅÅ1 3
==
ÅÅ4 6
id
ÅÅ7 9
)
ÅÅ9 :
;
ÅÅ: ;
var
ÉÉ 
	agreement
ÉÉ 
=
ÉÉ 
await
ÉÉ !
AsyncExecuter
ÉÉ" /
.
ÉÉ/ 0!
FirstOrDefaultAsync
ÉÉ0 C
(
ÉÉC D
query
ÉÉD I
)
ÉÉI J
;
ÉÉJ K
	agreement
ÖÖ 
.
ÖÖ 
RemoveExoneration
ÖÖ '
(
ÖÖ' (
	serviceId
ÖÖ( 1
)
ÖÖ1 2
;
ÖÖ2 3
return
áá 
	agreement
áá 
;
áá 
}
àà 	
public
ää 
virtual
ää 
async
ää 
Task
ää !
<
ää! "
bool
ää" &
>
ää& '#
ExistExonerationAsync
ää( =
(
ää= >
Guid
ää> B
agreementId
ääC N
,
ääN O
Guid
ääP T
	serviceId
ääU ^
)
ää^ _
{
ãã 	
Check
åå 
.
åå 
NotNull
åå 
(
åå 
agreementId
åå %
,
åå% &
nameof
åå' -
(
åå- .
agreementId
åå. 9
)
åå9 :
)
åå: ;
;
åå; <
Check
çç 
.
çç 
NotNull
çç 
(
çç 
	serviceId
çç #
,
çç# $
nameof
çç% +
(
çç+ ,
	serviceId
çç, 5
)
çç5 6
)
çç6 7
;
çç7 8
var
èè 
	queryable
èè 
=
èè 
await
èè !#
exonerationRepository
èè" 7
.
èè7 8
GetQueryableAsync
èè8 I
(
èèI J
)
èèJ K
;
èèK L
	queryable
êê 
=
êê 
	queryable
êê !
.
êê! "
Where
êê" '
(
êê' (
p
êê( )
=>
êê* ,
p
êê- .
.
êê. /

ConvenioId
êê/ 9
==
êê: <
agreementId
êê= H
)
êêH I
;
êêI J
	queryable
ëë 
=
ëë 
	queryable
ëë !
.
ëë! "
Where
ëë" '
(
ëë' (
p
ëë( )
=>
ëë* ,
p
ëë- .
.
ëë. /

ServicioId
ëë/ 9
==
ëë: <
	serviceId
ëë= F
)
ëëF G
;
ëëG H
return
ìì 
	queryable
ìì 
.
ìì 
Any
ìì  
(
ìì  !
)
ìì! "
;
ìì" #
}
îî 	
}
ïï 
}òò ˇ
eD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Convenio\EntidadAuspiciante.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public		 

class		 
EntidadAuspiciante		 #
:		$ %
Entity		& ,
<		, -
string		- 3
>		3 4
{

 
[ 	
Required	 
] 
[ 	
StringLength	 
( $
EntidadAuspicianteConsts .
.. /)
MaxEntidadAuspicianteIdLength/ L
)L M
]M N
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @
Alfanumericos@ M
)M N
]N O
public 
override 
string 
Id !
{" #
get$ '
;' (
	protected) 2
set3 6
;6 7
}8 9
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxNameLength) 6
)6 7
]7 8
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @,
 AlfanumericosGuionesPuntoEspacio@ `
)` a
]a b
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
	protected 
EntidadAuspiciante $
($ %
)% &
{ 	
} 	
public 
EntidadAuspiciante !
(! "
string" (
id) +
)+ ,
:	 

base 
( 
id 
) 
{ 	
} 	
} 
}   Î
lD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Convenio\EntidadAuspicianteManager.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

class %
EntidadAuspicianteManager *
:+ ,
DomainService- :
{ 
private 
readonly 
IStringLocalizer )
<) *&
AdministrativeUnitResource* D
>D E
	localizerF O
;O P
private 
readonly 
IRepository $
<$ %
EntidadAuspiciante% 7
,7 8
string9 ?
>? @

repositoryA K
;K L
public %
EntidadAuspicianteManager (
(( )
IRepository) 4
<4 5
EntidadAuspiciante5 G
,G H
stringI O
>O P

repositoryQ [
,[ \
IStringLocalizer 
< &
AdministrativeUnitResource 7
>7 8
	localizer9 B
)B C
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
	localizer 
= 
	localizer &
;& '
} 	
public 
async 
Task 
ValidateCreateAsync -
(- .
string. 4
input5 :
): ;
{ 	
var   
exist   
=   
await   

repository   (
.  ( )
AnyAsync  ) 1
(  1 2
e  2 3
=>  4 6
e  7 8
.  8 9
Id  9 ;
.  ; <
ToUpper  < C
(  C D
)  D E
==  F H
input  I N
.  N O
ToUpper  O V
(  V W
)  W X
)  X Y
;  Y Z
if!! 
(!! 
exist!! 
)!! 
{"" 
var## 
msg## 
=## 
string##  
.##  !
Format##! '
(##' (
	localizer##( 1
[##1 2
$str##2 L
]##L M
,##M N
input##O T
)##T U
;##U V
throw$$ 
new$$ !
UserFriendlyException$$ /
($$/ 0
msg$$0 3
)$$3 4
;$$4 5
}%% 
}&& 	
}'' 
}** õ"
^D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Convenio\Exoneracion.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{		 
public 

class 
Exoneracion 
: 
Entity %
{ 
[ 	
Required	 
] 
public 
Guid 

ConvenioId 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
public 
Guid 

ServicioId 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
public 
virtual 
decimal 
Valor $
{% &
get' *
;* +
set, /
;/ 0
}1 2
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )#
MaxGeographicalIdLength) @
)@ A
]A B
public 
string 
PaisId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
? 
EdadInicial 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
? 
	EdadFinal 
{ 
get  #
;# $
set% (
;( )
}* +
public!! 
bool!! 
?!! 
Discapacitado!! "
{!!# $
get!!% (
;!!( )
set!!* -
;!!- .
}!!/ 0
[$$ 	
Required$$	 
]$$ 
public%% 
string%% 
TipoExoneracionId%% '
{%%( )
get%%* -
;%%- .
set%%/ 2
;%%2 3
}%%4 5
public'' 
TipoExoneracion'' 
TipoExoneracion'' .
{''/ 0
get''1 4
;''4 5
set''6 9
;''9 :
}''; <
public)) 
string))  
EntidadAuspicianteId)) *
{))+ ,
get))- 0
;))0 1
set))2 5
;))5 6
}))7 8
public++ 
EntidadAuspiciante++ !
EntidadAuspiciante++" 4
{++5 6
get++7 :
;++: ;
set++< ?
;++? @
}++A B
public.. 
Exoneracion.. 
(.. 
Guid.. 

convenioId..  *
,..* +
Guid// 

servicioId// 
,// 
decimal00 
valor00 
,00 
string11 
tipoExoneracionId11 $
,11$ %
string22  
entidadAuspicianteId22 '
,22' (
string33 
paisId33 
,33 
int44 
?44 
edadInicial44 
,44 
int55 
?55 
	edadFinal55 
,55 
bool66 
?66 
discapacitado66 
)66  
{77 	

ConvenioId88 
=88 

convenioId88 #
;88# $

ServicioId99 
=99 

servicioId99 #
;99# $
Valor:: 
=:: 
valor:: 
;:: 
TipoExoneracionId;; 
=;; 
tipoExoneracionId;;  1
;;;1 2 
EntidadAuspicianteId<<  
=<<! " 
entidadAuspicianteId<<# 7
;<<7 8
PaisId== 
=== 
paisId== 
;== 
EdadInicial>> 
=>> 
edadInicial>> %
;>>% &
	EdadFinal?? 
=?? 
	edadFinal?? !
;??! "
Discapacitado@@ 
=@@ 
discapacitado@@ )
;@@) *
}AA 	
publicCC 
overrideCC 
objectCC 
[CC 
]CC  
GetKeysCC! (
(CC( )
)CC) *
{DD 	
returnEE 
newEE 
objectEE 
[EE 
]EE 
{EE  !

ConvenioIdEE" ,
,EE, -

ServicioIdEE. 8
}EE9 :
;EE: ;
}FF 	
}GG 
}HH Ì
bD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Convenio\TipoExoneracion.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public		 

class		 
TipoExoneracion		  
:		! "
Entity		# )
<		) *
string		* 0
>		0 1
{

 
[ 	
Required	 
] 
[ 	
StringLength	 
( !
TipoExoneracionConsts +
.+ ,&
MaxTipoExoneracionIdLength, F
)F G
]G H
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @
Alfanumericos@ M
)M N
]N O
public 
override 
string 
Id !
{" #
get$ '
;' (
	protected) 2
set3 6
;6 7
}8 9
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxNameLength) 6
)6 7
]7 8
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @,
 AlfanumericosGuionesPuntoEspacio@ `
)` a
]a b
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
	protected 
TipoExoneracion !
(! "
)" #
{ 	
} 	
public 
TipoExoneracion 
( 
string %
id& (
)( )
:	 

base 
( 
id 
) 
{ 	
} 	
} 
}   ‹
iD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Convenio\TipoExoneracionManager.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

class "
TipoExoneracionManager '
:( )
DomainService* 7
{ 
private 
readonly 
IStringLocalizer )
<) *&
AdministrativeUnitResource* D
>D E
	localizerF O
;O P
private 
readonly 
IRepository $
<$ %
TipoExoneracion% 4
,4 5
string6 <
>< =

repository> H
;H I
public "
TipoExoneracionManager %
(% &
IRepository& 1
<1 2
TipoExoneracion2 A
,A B
stringC I
>I J

repositoryK U
,U V
IStringLocalizer 
< &
AdministrativeUnitResource 7
>7 8
	localizer9 B
)B C
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
	localizer 
= 
	localizer &
;& '
} 	
public 
async 
Task 
ValidateCreateAsync -
(- .
string. 4
input5 :
): ;
{ 	
var   
exist   
=   
await   

repository   (
.  ( )
AnyAsync  ) 1
(  1 2
e  2 3
=>  4 6
e  7 8
.  8 9
Id  9 ;
.  ; <
ToUpper  < C
(  C D
)  D E
==  F H
input  I N
.  N O
ToUpper  O V
(  V W
)  W X
)  X Y
;  Y Z
if!! 
(!! 
exist!! 
)!! 
{"" 
var## 
msg## 
=## 
string##  
.##  !
Format##! '
(##' (
	localizer##( 1
[##1 2
$str##2 I
]##I J
,##J K
input##L Q
)##Q R
;##R S
throw$$ 
new$$ !
UserFriendlyException$$ /
($$/ 0
msg$$0 3
)$$3 4
;$$4 5
}%% 
}&& 	
}'' 
}** ≥
XD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Servicio\Cargo.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public		 

class		 
Cargo		 
:		 
Entity		 
<		  
string		  &
>		& '
{

 
	protected 
Cargo 
( 
) 
{ 	
} 	
public 
Cargo 
( 
string 
id 
) 
:	 

base 
( 
id 
) 
{ 	
} 	
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxIdLength) 4
)4 5
]5 6
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @
Alfanumericos@ M
)M N
]N O
public 
override 
string 
Id !
{" #
get$ '
;' (
	protected) 2
set3 6
;6 7
}8 9
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxNameLength) 6
)6 7
]7 8
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @,
 AlfanumericosGuionesPuntoEspacio@ `
)` a
]a b
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
} 
}   ™
_D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Servicio\CargoManager.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

class 
CargoManager 
: 
DomainService  -
{ 
private 
readonly 
IStringLocalizer )
<) *&
AdministrativeUnitResource* D
>D E
	localizerF O
;O P
private 
readonly 
IRepository $
<$ %
Cargo% *
,* +
string, 2
>2 3

repository4 >
;> ?
public 
CargoManager 
( 
IRepository '
<' (
Cargo( -
,- .
string/ 5
>5 6

repository7 A
,A B
IStringLocalizer 
< &
AdministrativeUnitResource 7
>7 8
	localizer9 B
)B C
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
	localizer 
= 
	localizer &
;& '
} 	
public 
async 
Task 
ValidateCreateAsync -
(- .
string. 4
input5 :
): ;
{ 	
var   
exist   
=   
await   

repository   (
.  ( )
AnyAsync  ) 1
(  1 2
e  2 3
=>  4 6
e  7 8
.  8 9
Id  9 ;
.  ; <
ToUpper  < C
(  C D
)  D E
==  F H
input  I N
.  N O
ToUpper  O V
(  V W
)  W X
)  X Y
;  Y Z
if!! 
(!! 
exist!! 
)!! 
{"" 
var## 
msg## 
=## 
string##  
.##  !
Format##! '
(##' (
	localizer##( 1
[##1 2
$str##2 B
]##B C
,##C D
input##E J
)##J K
;##K L
throw$$ 
new$$ !
UserFriendlyException$$ /
($$/ 0
msg$$0 3
)$$3 4
;$$4 5
}%% 
}&& 	
}'' 
}(( Ø
XD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Servicio\Libro.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

class 
Libro 
: 
Entity 
<  
string  &
>& '
{ 
[ 	
Required	 
] 
[		 	
StringLength			 
(		 

BookConsts		  
.		  !
MaxBookIdLength		! 0
)		0 1
]		1 2
[

 	
RegularExpression

	 
(

 
DomainCommonConsts

 -
.

- .
ExpressionRegular

. ?
.

? @
Alfanumericos

@ M
)

M N
]

N O
public 
override 
string 
Id !
{" #
get$ '
;' (
	protected) 2
set3 6
;6 7
}8 9
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxNameLength) 6
)6 7
]7 8
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @,
 AlfanumericosGuionesPuntoEspacio@ `
)` a
]a b
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
	protected 
Libro 
( 
) 
{ 	
} 	
public 
Libro 
( 
string 
id 
) 
:	 

base 
( 
id 
) 
{ 	
} 	
} 
} ™
_D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Servicio\LibroManager.cs
	namespace		 	
Mre		
 
.		 
Sb		 
.		  
UnidadAdministrativa		 %
.		% &
Dominio		& -
{

 
public

 

class

 
LibroManager

 
:

 
DomainService

  -
{ 
private 
readonly 
IStringLocalizer )
<) *&
AdministrativeUnitResource* D
>D E
	localizerF O
;O P
private 
readonly 
IRepository $
<$ %
Libro% *
,* +
string, 2
>2 3

repository4 >
;> ?
public 
LibroManager 
( 
IRepository '
<' (
Libro( -
,- .
string/ 5
>5 6

repository7 A
,A B
IStringLocalizer 
< &
AdministrativeUnitResource 7
>7 8
	localizer9 B
)B C
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
	localizer 
= 
	localizer &
;& '
} 	
public 
async 
Task 
ValidateCreateAsync -
(- .
string. 4
input5 :
): ;
{ 	
var 
exist 
= 
await 

repository (
.( )
AnyAsync) 1
(1 2
e2 3
=>4 6
e7 8
.8 9
Id9 ;
.; <
ToUpper< C
(C D
)D E
==F H
inputI N
.N O
ToUpperO V
(V W
)W X
)X Y
;Y Z
if 
( 
exist 
) 
{ 
var 
msg 
= 
string  
.  !
Format! '
(' (
	localizer( 1
[1 2
$str2 >
]> ?
,? @
inputA F
)F G
;G H
throw   
new   !
UserFriendlyException   /
(  / 0
msg  0 3
)  3 4
;  4 5
}!! 
}"" 	
}## 
}&& æ
bD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Servicio\SecuencialLibro.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

class 
SecuencialLibro  
:! " 
AuditedAggregateRoot# 7
<7 8
Guid8 <
>< =
{ 
	protected 
SecuencialLibro !
(! "
)" #
{ 	
} 	
public 
SecuencialLibro 
( 
Guid #
id$ &
,& '
Guid( ,
	serviceId- 6
,6 7
Guid8 < 
administrativeUnitId= Q
,Q R
stringS Y
bookIdZ `
,` a
intb e
numberPageByVolumef x
,x y
intz }
currentVolume	~ ã
,
ã å
int
ç ê
nextPage
ë ô
,
ô ö
int
õ û
year
ü £
)
£ §
{ 	
Id 
= 
id 
; 

ServicioId 
= 
	serviceId "
;" #"
UnidadAdministrativaId "
=# $ 
administrativeUnitId% 9
;9 :
LibroId 
= 
bookId 
; "
NumeroPaginaPorVolumen "
=# $
numberPageByVolume% 7
;7 8
VolumenActual 
= 
currentVolume )
;) *
SiguientePagina 
= 
nextPage &
;& '
Anio 
= 
year 
; 
} 	
[   	
Required  	 
]   
public!! 
Guid!! 

ServicioId!! 
{!!  
get!!! $
;!!$ %
set!!& )
;!!) *
}!!+ ,
public## 
Guid## "
UnidadAdministrativaId## *
{##+ ,
get##- 0
;##0 1
set##2 5
;##5 6
}##7 8
[%% 	
Required%%	 
]%% 
public&& 
string&& 
LibroId&& 
{&& 
get&&  #
;&&# $
set&&% (
;&&( )
}&&* +
public(( 
Libro(( 
Libro(( 
{(( 
get((  
;((  !
set((" %
;((% &
}((' (
[** 	
Required**	 
]** 
public++ 
int++ "
NumeroPaginaPorVolumen++ )
{++* +
get++, /
;++/ 0
set++1 4
;++4 5
}++6 7
[-- 	
Required--	 
]-- 
public.. 
int.. 
VolumenActual..  
{..! "
get..# &
;..& '
set..( +
;..+ ,
}..- .
public00 
int00 
SiguientePagina00 "
{00# $
get00% (
;00( )
set00* -
;00- .
}00/ 0
public22 
int22 
Anio22 
{22 
get22 
;22 
set22 "
;22" #
}22$ %
}33 
}44 ‘ 
iD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Servicio\SecuencialLibroManager.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

class "
SecuencialLibroManager '
:( )
DomainService* 7
{ 
private 
readonly 
IRepository $
<$ %
SecuencialLibro% 4
,4 5
Guid6 :
>: ;$
sequentialBookRepository< T
;T U
private 
readonly 
IStringLocalizer )
<) *&
AdministrativeUnitResource* D
>D E
	localizerF O
;O P
public "
SecuencialLibroManager %
(% &
IRepository& 1
<1 2
SecuencialLibro2 A
,A B
GuidC G
>G H$
sequentialBookRepositoryI a
,a b
IStringLocalizerc s
<s t'
AdministrativeUnitResource	t é
>
é è
	localizer
ê ô
)
ô ö
{ 	
this 
. $
sequentialBookRepository )
=* +$
sequentialBookRepository, D
;D E
this 
. 
	localizer 
= 
	localizer &
;& '
} 	
public 
virtual 
async 
Task !
<! "
SecuencialLibro" 1
>1 2
CreateAsync3 >
(> ?
Guid? C
idD F
,F G
GuidH L 
administrativeUnitIdM a
,a b
Guidc g
	serviceIdh q
,q r
strings y
bookId	z Ä
,
Ä Å
int 
numberPageByVolume %
,% &
int' *
currentVolume+ 8
,8 9
int: =
nextPage> F
,F G
intH K
yearL P
)P Q
{ 	
var 
	queryable 
= 
await !$
sequentialBookRepository" :
.: ;
GetQueryableAsync; L
(L M
)M N
;N O
var   
existing   
=   
	queryable   $
.  $ %
Any  % (
(  ( )
e  ) *
=>  + -
e  . /
.  / 0

ServicioId  0 :
==  ; =
	serviceId  > G
&&  H J
e  K L
.  L M"
UnidadAdministrativaId  M c
==  d f 
administrativeUnitId  g {
&&  | ~
e	   Ä
.
  Ä Å
LibroId
  Å à
==
  â ã
bookId
  å í
)
  í ì
;
  ì î
if"" 
("" 
existing"" 
)"" 
{## 
var$$ 
msg$$ 
=$$ 
string$$  
.$$  !
Format$$! '
($$' (
	localizer$$( 1
[$$1 2
$str$$2 H
]$$H I
)$$I J
;$$J K
throw%% 
new%% !
UserFriendlyException%% /
(%%/ 0
msg%%0 3
)%%3 4
;%%4 5
}&& 
var(( 
entity(( 
=(( 
new(( 
SecuencialLibro(( ,
(((, -
id((- /
:((/ 0
id((1 3
,((3 4
	serviceId((5 >
:((> ?
	serviceId((@ I
,((I J 
administrativeUnitId((K _
:((_ ` 
administrativeUnitId((a u
,((u v
bookId((w }
:((} ~
bookId	(( Ö
,
((Ö Ü 
numberPageByVolume
((á ô
:
((ô ö 
numberPageByVolume
((õ ≠
,
((≠ Æ
currentVolume
((Ø º
:
((º Ω
currentVolume
((æ À
,
((À Ã
nextPage
((Õ ’
:
((’ ÷
nextPage
((◊ ﬂ
,
((ﬂ ‡
year
((· Â
:
((Â Ê
year
((Á Î
)
((Î Ï
;
((Ï Ì
return** 
entity** 
;** 
}++ 	
},, 
}-- Å
[D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Servicio\Servicio.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

class 
Servicio 
:  
AuditedAggregateRoot 0
<0 1
Guid1 5
>5 6
{ 
	protected 
Servicio 
( 
) 
{ 	
} 	
public 
Servicio 
( 
Guid 
id 
,  
string! '
name( ,
,, -
string. 4
serviceTypeId5 B
,B C
boolD H!
isPresentialAttentionI ^
,^ _
bool` d%
isSemipresentialAttentione ~
,~ 
bool
Ä Ñ 
isVirtualAttention
Ö ó
,
ó ò
bool
ô ù
isActive
û ¶
=
¶ ß
true
ß ´
)
´ ¨
{ 	
Id 
= 
id 
; 
Nombre 
= 
name 
; 
TipoServicioId 
= 
serviceTypeId *
;* +
AtencionPresencial 
=  !
isPresentialAttention! 6
;6 7"
AtencionSemiPresencial "
=# $%
isSemipresentialAttention% >
;> ?
AtencionVirtual 
= 
isVirtualAttention 0
;0 1
Activo 
= 
isActive 
; 
} 	
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxNameLength) 6
)6 7
]7 8
[   	
RegularExpression  	 
(   
DomainCommonConsts   -
.  - .
ExpressionRegular  . ?
.  ? @,
 AlfanumericosGuionesPuntoEspacio  @ `
)  ` a
]  a b
public!! 
string!! 
Nombre!! 
{!! 
get!! "
;!!" #
	protected!!$ -
set!!. 1
;!!1 2
}!!3 4
public## 
bool## 
AtencionPresencial## &
{##' (
get##) ,
;##, -
set##. 1
;##1 2
}##3 4
public%% 
bool%% "
AtencionSemiPresencial%% *
{%%+ ,
get%%- 0
;%%0 1
set%%2 5
;%%5 6
}%%7 8
public'' 
bool'' 
AtencionVirtual'' #
{''$ %
get''& )
;'') *
set''+ .
;''. /
}''0 1
[)) 	
Required))	 
])) 
public** 
string** 
TipoServicioId** $
{**% &
get**' *
;*** +
set**, /
;**/ 0
}**1 2
public,, 
TipoServicio,, 
TipoServicio,, (
{,,) *
get,,+ .
;,,. /
set,,0 3
;,,3 4
},,5 6
[.. 	
Required..	 
].. 
public// 
bool// 
Activo// 
{// 
get//  
;//  !
	protected//" +
set//, /
;/// 0
}//1 2
public22 
void22 

ChangeName22 
(22 
string22 %
newName22& -
)22- .
{22/ 0
this33 
.33 
Nombre33 
=33 
newName33 !
;33! "
}44 	
public66 
void66 
ChangeIsActive66 "
(66" #
bool66# '
newIsActive66( 3
)663 4
{77 	
this88 
.88 
Activo88 
=88 
newIsActive88 %
;88% &
}99 	
}:: 
}<< ˇ
fD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Servicio\ServicioFuncionario.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

class 
ServicioFuncionario $
:% &
Entity' -
{ 
	protected		 
ServicioFuncionario		 %
(		% &
)		& '
{

 	
} 	
public 
ServicioFuncionario "
(" #
Guid# '
userId( .
,. /
Guid0 4
	serviceId5 >
,> ?
string@ F

positionIdG Q
)Q R
{ 	
	UsuarioId 
= 
userId 
; 

ServicioId 
= 
	serviceId "
;" #
CargoId 
= 

positionId  
;  !
} 	
[ 	
Required	 
] 
public 
Guid 
	UsuarioId 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Required	 
] 
public 
Guid 

ServicioId 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxIdLength) 4
)4 5
]5 6
public 
string 
CargoId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
override 
object 
[ 
]  
GetKeys! (
(( )
)) *
{   	
return!! 
new!! 
object!! 
[!! 
]!! 
{!!  !

ServicioId!!" ,
,!!, -
	UsuarioId!!. 7
}!!8 9
;!!9 :
}"" 	
}## 
}$$ ”2
bD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Servicio\ServicioManager.cs
	namespace

 	
Mre


 
.

 
Sb

 
.

  
UnidadAdministrativa

 %
.

% &
Dominio

& -
{ 
public 

class 
ServicioManager  
:! "
DomainService# 0
{ 
private 
readonly 
IRepository $
<$ %
Servicio% -
,- .
Guid/ 3
>3 4

repository5 ?
;? @
private 
readonly 
IStringLocalizer )
<) *&
AdministrativeUnitResource* D
>D E
	localizerF O
;O P
public 
ServicioManager 
( 
IRepository *
<* +
Servicio+ 3
,3 4
Guid4 8
>8 9

repository: D
,D E
IStringLocalizer 
< &
AdministrativeUnitResource 7
>7 8
	localizer9 B
)B C
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
	localizer 
= 
	localizer &
;& '
} 	
public 
virtual 
async 
Task !
<! "
Servicio" *
>* +
CreateAsync, 7
(7 8
Guid8 <
id= ?
,? @
stringA G
nameH L
,L M
string 
serviceTypeId $
,$ %
bool& *!
isPresentialAttention+ @
,@ A
boolB F%
isSemipresentialAttentionG `
,` a
boolb f
isVirtualAttentiong y
,y z
bool{ 
isActive
Ä à
=
à â
true
â ç
)
ç é
{
è ê
var 
	queryable 
= 
await !

repository" ,
., -
GetQueryableAsync- >
(> ?
)? @
;@ A
var 
existing 
= 
	queryable $
.$ %
Any% (
(( )
e) *
=>+ -
e. /
./ 0
Nombre0 6
.6 7
ToUpper7 >
(> ?
)? @
==A C
nameD H
.H I
ToUpperI P
(P Q
)Q R
)R S
;S T
if 
( 
existing 
) 
{ 
throw   
new   !
UserFriendlyException   /
(  / 0
string  0 6
.  6 7
Format  7 =
(  = >
	localizer  > G
[  G H
$str  H [
]  [ \
,  \ ]
name  ^ b
)  b c
)  c d
;  d e
}!! 
var## 
entity## 
=## 
new## 
Servicio## %
(##% &
id##& (
,##( )
name##) -
,##- .
serviceTypeId##/ <
:##< =
serviceTypeId##> K
,##K L!
isPresentialAttention$$ %
:$$% &!
isPresentialAttention$$' <
,$$< =%
isSemipresentialAttention$$> W
:$$W X%
isSemipresentialAttention$$Y r
,$$r s
isVirtualAttention	$$t Ü
:
$$Ü á 
isVirtualAttention
$$à ö
,
$$ö õ
isActive
$$ú §
:
$$§ •
isActive
$$¶ Æ
)
$$Æ Ø
;
$$Ø ∞
return&& 
entity&& 
;&& 
}'' 	
public)) 
async)) 
Task)) 
ChangeNameAsync)) )
())) *
Servicio** 
service** 
,**  
string++ 
newName++ 
)++ 
{,, 	
Check-- 
.-- 
NotNull-- 
(-- 
service-- !
,--! "
nameof--# )
(--) *
service--* 1
)--1 2
)--2 3
;--3 4
Check.. 
... 
NotNullOrWhiteSpace.. %
(..% &
newName..& -
,..- .
nameof../ 5
(..5 6
newName..6 =
)..= >
)..> ?
;..? @
var00 
	queryable00 
=00 
await00 !

repository00" ,
.00, -
GetQueryableAsync00- >
(00> ?
)00? @
;00@ A
var11 
existing11 
=11 
	queryable11 $
.11$ %
Any11% (
(11( )
e11) *
=>11+ -
e11. /
.11/ 0
Nombre110 6
.116 7
ToUpper117 >
(11> ?
)11? @
==11A C
newName11D K
.11K L
ToUpper11L S
(11S T
)11T U
&&11V X
e22 
.22 
Id22 
==22 
service22 #
.22# $
Id22$ &
)22& '
;22' (
if44 
(44 
existing44 
)44 
{55 
throw66 
new66 
AbpException66 %
(66% &
string66& ,
.66, -
Format66- 3
(663 4
	localizer664 =
[66= >
$str66> Q
]66Q R
,66R S
newName66T [
)66[ \
)66\ ]
;66] ^
}77 
service99 
.99 

ChangeName99 
(99 
newName99 &
)99& '
;99' (
}:: 	
public== 
async== 
Task== 
ChangeIsActiveAsync== -
(==- .
Servicio>> 
service>> 
,>>  
bool?? 
isActive?? 
)?? 
{@@ 	
CheckAA 
.AA 
NotNullAA 
(AA 
serviceAA !
,AA! "
nameofAA# )
(AA) *
serviceAA* 1
)AA1 2
)AA2 3
;AA3 4
CheckBB 
.BB 
NotNullBB 
(BB 
isActiveBB "
,BB" #
nameofBB$ *
(BB* +
isActiveBB+ 3
)BB3 4
)BB4 5
;BB5 6
serviceFF 
.FF 
ChangeIsActiveFF "
(FF" #
isActiveFF# +
)FF+ ,
;FF, -
}GG 	
}HH 
}JJ ø
[D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Servicio\TipoPago.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public		 

class		 
TipoPago		 
:		 
Entity		 "
<		" #
string		# )
>		) *
{

 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxIdLength) 4
)4 5
]5 6
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @
Alfanumericos@ M
)M N
]N O
public 
override 
string 
Id !
{" #
get$ '
;' (
	protected) 2
set3 6
;6 7
}8 9
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxNameLength) 6
)6 7
]7 8
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @,
 AlfanumericosGuionesPuntoEspacio@ `
)` a
]a b
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
	protected 
TipoPago 
( 
) 
{ 	
} 	
public 
TipoPago 
( 
string 
id !
)! "
:	 

base 
( 
id 
) 
{ 	
} 	
} 
}## π
bD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Servicio\TipoPagoManager.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{		 
public

 

class

 
TipoPagoManager

  
:

! "
DomainService

# 0
{ 
private 
readonly 
IStringLocalizer )
<) *&
AdministrativeUnitResource* D
>D E
	localizerF O
;O P
private 
readonly 
IRepository $
<$ %
TipoPago% -
,- .
string/ 5
>5 6

repository7 A
;A B
public 
TipoPagoManager 
( 
IRepository *
<* +
TipoPago+ 3
,3 4
string5 ;
>; <

repository= G
,G H
IStringLocalizer 
< &
AdministrativeUnitResource 7
>7 8
	localizer9 B
)B C
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
	localizer 
= 
	localizer &
;& '
} 	
public 
async 
Task 
ValidateCreateAsync -
(- .
string. 4
input5 :
): ;
{ 	
var 
exist 
= 
await 

repository (
.( )
AnyAsync) 1
(1 2
e2 3
=>4 6
e7 8
.8 9
Id9 ;
.; <
ToUpper< C
(C D
)D E
==F H
inputI N
.N O
ToUpperO V
(V W
)W X
)X Y
;Y Z
if 
( 
exist 
) 
{ 
var 
msg 
= 
string  
.  !
Format! '
(' (
	localizer( 1
[1 2
$str2 E
]E F
,F G
inputH M
)M N
;N O
throw   
new   !
UserFriendlyException   /
(  / 0
msg  0 3
)  3 4
;  4 5
}!! 
}"" 	
}## 
}'' œ
_D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Servicio\TipoServicio.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public		 

class		 
TipoServicio		 
:		 
Entity		  &
<		& '
string		' -
>		- .
{

 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxIdLength) 4
)4 5
]5 6
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @
Alfanumericos@ M
)M N
]N O
public 
override 
string 
Id !
{" #
get$ '
;' (
	protected) 2
set3 6
;6 7
}8 9
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxNameLength) 6
)6 7
]7 8
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @,
 AlfanumericosGuionesPuntoEspacio@ `
)` a
]a b
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
	protected 
TipoServicio 
( 
)  
{ 	
} 	
public 
TipoServicio 
( 
string "
id# %
)% &
:	 

base 
( 
id 
) 
{ 	
} 	
} 
}   Õ
fD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Servicio\TipoServicioManager.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

class 
TipoServicioManager $
:% &
DomainService' 4
{ 
private 
readonly 
IStringLocalizer )
<) *&
AdministrativeUnitResource* D
>D E
	localizerF O
;O P
private 
readonly 
IRepository $
<$ %
TipoServicio% 1
,1 2
string3 9
>9 :

repository; E
;E F
public 
TipoServicioManager "
(" #
IRepository# .
<. /
TipoServicio/ ;
,; <
string= C
>C D

repositoryE O
,O P
IStringLocalizer 
< &
AdministrativeUnitResource 7
>7 8
	localizer9 B
)B C
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
	localizer 
= 
	localizer &
;& '
} 	
public 
async 
Task 
ValidateCreateAsync -
(- .
string. 4
input5 :
): ;
{ 	
var!! 
exist!! 
=!! 
await!! 

repository!! (
.!!( )
AnyAsync!!) 1
(!!1 2
e!!2 3
=>!!4 6
e!!7 8
.!!8 9
Id!!9 ;
.!!; <
ToUpper!!< C
(!!C D
)!!D E
==!!F H
input!!I N
.!!N O
ToUpper!!O V
(!!V W
)!!W X
)!!X Y
;!!Y Z
if"" 
("" 
exist"" 
)"" 
{## 
var$$ 
msg$$ 
=$$ 
string$$  
.$$  !
Format$$! '
($$' (
	localizer$$( 1
[$$1 2
$str$$2 E
]$$E F
,$$F G
input$$H M
)$$M N
;$$N O
throw%% 
new%% !
UserFriendlyException%% /
(%%/ 0
msg%%0 3
)%%3 4
;%%4 5
}&& 
}'' 	
}(( 
}++ ±
~D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Settings\AdministrativeUnitSettingDefinitionProvider.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Settings& .
{ 
public 

class 7
+AdministrativeUnitSettingDefinitionProvider <
:= >%
SettingDefinitionProvider? X
{ 
public 
override 
void 
Define #
(# $%
ISettingDefinitionContext$ =
context> E
)E F
{ 	
} 	
} 
} ß
mD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Settings\AdministrativeUnitSettings.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Settings& .
{ 
public 

static 
class &
AdministrativeUnitSettings 2
{ 
public 
const 
string 
	GroupName %
=& '
$str( <
;< =
}

 
} ª
dD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\UnidadAdministrativa\Banco.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public		 

class		 
Banco		 
:		 
Entity		 
<		  
string		  &
>		& '
{

 
[ 	
Required	 
] 
[ 	
StringLength	 
( 

BankConsts  
.  !
MaxBankIdLength! 0
)0 1
]1 2
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @
Alfanumericos@ M
)M N
]N O
public 
override 
string 
Id !
{" #
get$ '
;' (
	protected) 2
set3 6
;6 7
}8 9
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxNameLength) 6
)6 7
]7 8
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @,
 AlfanumericosGuionesPuntoEspacio@ `
)` a
]a b
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
	protected 
Banco 
( 
) 
{ 	
} 	
public 
Banco 
( 
string 
id 
) 
:	 

base 
( 
id 
) 
{ 	
} 	
}   
}!! ∂
kD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\UnidadAdministrativa\BancoManager.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{		 
public

 

class

 
BancoManager

 
:

 
DomainService

  -
{ 
private 
readonly 
IStringLocalizer )
<) *&
AdministrativeUnitResource* D
>D E
	localizerF O
;O P
private 
readonly 
IRepository $
<$ %
Banco% *
,* +
string, 2
>2 3

repository4 >
;> ?
public 
BancoManager 
( 
IRepository '
<' (
Banco( -
,- .
string/ 5
>5 6

repository7 A
,A B
IStringLocalizer 
< &
AdministrativeUnitResource 7
>7 8
	localizer9 B
)B C
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
	localizer 
= 
	localizer &
;& '
} 	
public 
async 
Task 
ValidateCreateAsync -
(- .
string. 4
input5 :
): ;
{ 	
var 
exist 
= 
await 

repository (
.( )
AnyAsync) 1
(1 2
e2 3
=>4 6
e7 8
.8 9
Id9 ;
.; <
ToUpper< C
(C D
)D E
==F H
inputI N
.N O
ToUpperO V
(V W
)W X
)X Y
;Y Z
if 
( 
exist 
) 
{ 
var 
msg 
= 
string  
.  !
Format! '
(' (
	localizer( 1
[1 2
$str2 >
]> ?
,? @
inputA F
)F G
;G H
throw   
new   !
UserFriendlyException   /
(  / 0
msg  0 3
)  3 4
;  4 5
}!! 
}"" 	
}## 
}'' „
vD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\UnidadAdministrativa\ConfiguracionSignatario.cs
	namespace

 	
Mre


 
.

 
Sb

 
.

  
UnidadAdministrativa

 %
.

% &
Dominio

& -
{ 
public 

class #
ConfiguracionSignatario (
:) *
AuditedEntity+ 8
<8 9
Guid9 =
>= >
{ 
	protected #
ConfiguracionSignatario )
() *
)* +
{ 	
} 	
public #
ConfiguracionSignatario &
(& '
Guid' +
id, .
,. /
Guid0 4
	usuarioId5 >
,> ?
string@ F
nombreArchivoG T
,T U
stringV \
tipoContenido] j
,j k
stringl r
	extensions |
,| }
byte	~ Ç
[
Ç É
]
É Ñ
data
Ö â
,
â ä
string
ã ë
clave
í ó
)
ó ò
{ 	
Id 
= 
id 
; 
	UsuarioId 
= 
	usuarioId !
;! "
NombreArchivo 
= 
nombreArchivo )
;) *
TipoContenido 
= 
tipoContenido )
;) *
	Extension 
= 
	extension !
;! "
Data 
= 
data 
; 
Clave   
=   
clave   
;   
}!! 	
[&& 	
Required&&	 
]&& 
public'' 
Guid'' 
	UsuarioId'' 
{'' 
get''  #
;''# $
set''% (
;''( )
}''* +
[,, 	
StringLength,,	 
(,, 
SignatarioConsts,, &
.,,& '"
MaxNombreArchivoLength,,' =
),,= >
],,> ?
public-- 
virtual-- 
string-- 
NombreArchivo-- +
{--, -
get--. 1
;--1 2
set--3 6
;--6 7
}--8 9
[22 	
StringLength22	 
(22 
SignatarioConsts22 &
.22& '"
MaxTipoContenidoLength22' =
)22= >
]22> ?
public33 
virtual33 
string33 
TipoContenido33 +
{33, -
get33. 1
;331 2
set333 6
;336 7
}338 9
[88 	
StringLength88	 
(88 
SignatarioConsts88 &
.88& '
MaxExtensionLength88' 9
)889 :
]88: ;
public99 
virtual99 
string99 
	Extension99 '
{99( )
get99* -
;99- .
set99/ 2
;992 3
}994 5
[>> 	
Required>>	 
]>> 
public?? 
virtual?? 
byte?? 
[?? 
]?? 
Data?? "
{??# $
get??% (
;??( )
set??* -
;??- .
}??/ 0
[DD 	
RequiredDD	 
]DD 
[EE 	
StringLengthEE	 
(EE 
SignatarioConstsEE &
.EE& '
MaxClaveLengthEE' 5
)EE5 6
]EE6 7
publicFF 
virtualFF 
stringFF 
ClaveFF #
{FF$ %
getFF& )
;FF) *
setFF+ .
;FF. /
}FF0 1
}II 
}KK ≥
}D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\UnidadAdministrativa\ConfiguracionSignatarioManager.cs
	namespace		 	
Mre		
 
.		 
Sb		 
.		  
UnidadAdministrativa		 %
.		% &
Dominio		& -
{

 
public 

class *
ConfiguracionSignatarioManager /
:0 1
DomainService2 ?
{ 
private 
readonly 
IRepository $
<$ %#
ConfiguracionSignatario% <
,< =
Guid> B
>B C

repositoryD N
;N O
public *
ConfiguracionSignatarioManager -
(- .
IRepository. 9
<9 :#
ConfiguracionSignatario: Q
,Q R
GuidS W
>W X

repositoryY c
)c d
{ 	
this 
. 

repository 
= 

repository (
;( )
} 	
public 
async 
Task 
< 
bool 
> $
PoseenConfiguracionAsync  8
(8 9
Guid9 =

usuariosId> H
)H I
{ 	
var 
consulta 
= 
await  

repository! +
.+ ,
GetQueryableAsync, =
(= >
)> ?
;? @
consulta 
= 
consulta 
.  
Where  %
(% &
x& '
=>( *
x+ ,
., -
	UsuarioId- 6
==7 9

usuariosId: D
)D E
;E F
var 
	resultado 
= 
await !
AsyncExecuter" /
./ 0
AnyAsync0 8
(8 9
consulta9 A
)A B
;B C
return 
	resultado 
; 
} 	
public 
async 
Task 
< 
List 
< 
Guid #
># $
>$ %$
PoseenConfiguracionAsync& >
(> ?
List? C
<C D
GuidD H
>H I
usuariosIdsJ U
)U V
{ 	
var   
consulta   
=   
await    

repository  ! +
.  + ,
GetQueryableAsync  , =
(  = >
)  > ?
;  ? @
consulta!! 
=!! 
consulta!! 
.!!  
Where!!  %
(!!% &
x!!& '
=>!!( *
usuariosIds!!+ 6
.!!6 7
Contains!!7 ?
(!!? @
x!!@ A
.!!A B
	UsuarioId!!B K
)!!K L
)!!L M
;!!M N
var## 
consultaResultado## !
=##" #
consulta##$ ,
.##, -
Select##- 3
(##3 4
x##4 5
=>##6 8
x##9 :
.##: ;
	UsuarioId##; D
)##D E
;##E F
var%% 
	resultado%% 
=%% 
await%% !
AsyncExecuter%%" /
.%%/ 0
ToListAsync%%0 ;
(%%; <
consultaResultado%%< M
)%%M N
;%%N O
return'' 
	resultado'' 
;'' 
}(( 	
}** 
}++ ì
kD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\UnidadAdministrativa\Jurisdiccion.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public

 

class

 
Jurisdiccion

 
:

 
Entity

 %
{ 
public 
Jurisdiccion 
( 
Guid  "
unidadAdministrativaId! 7
,7 8
string9 ?
ciudad@ F
)F G
{ 	"
UnidadAdministrativaId "
=# $"
unidadAdministrativaId% ;
;; <
Ciudad 
= 
ciudad 
. 
ToUpper #
(# $
)$ %
;% &
} 	
[ 	
Required	 
] 
public 
Guid "
UnidadAdministrativaId *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxAddressLength) 9
)9 :
]: ;
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @,
 AlfanumericosGuionesPuntoEspacio@ `
)` a
]a b
public 
string 
Ciudad 
{ 
get "
;" #
set$ '
;' (
}) *
public 
override 
object 
[ 
]  
GetKeys! (
(( )
)) *
{ 	
return 
new 
object 
[ 
] 
{  !"
UnidadAdministrativaId" 8
,8 9
Ciudad: @
}A B
;B C
} 	
}!! 
}"" Å
eD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\UnidadAdministrativa\Moneda.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

class 
Moneda 
: 
Entity  
<  !
string! '
>' (
{ 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
CurrencyConsts $
.$ %
MaxCurrencyIdLength% 8
)8 9
]9 :
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @
Alfanumericos@ M
)M N
]N O
public 
override 
string 
Id !
{" #
get$ '
;' (
	protected) 2
set3 6
;6 7
}8 9
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxNameLength) 6
)6 7
]7 8
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @,
 AlfanumericosGuionesPuntoEspacio@ `
)` a
]a b
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
StringLength	 
( 
CurrencyConsts $
.$ %
MaxSimboloLength% 5
)5 6
]6 7
public 
string 
Simbolo 
{ 
get  #
;# $
set% (
;( )
}* +
	protected 
Moneda 
( 
) 
{ 	
} 	
public!! 
Moneda!! 
(!! 
string!! 
id!! 
)!!  
:""	 

base"" 
("" 
id"" 
)"" 
{## 	
}%% 	
}&& 
}'' ª
lD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\UnidadAdministrativa\MonedaManager.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

class 
MonedaManager 
:  
DomainService! .
{ 
private 
readonly 
IStringLocalizer )
<) *&
AdministrativeUnitResource* D
>D E
	localizerF O
;O P
private 
readonly 
IRepository $
<$ %
Moneda% +
,+ ,
string- 3
>3 4

repository5 ?
;? @
public 
MonedaManager 
( 
IRepository (
<( )
Moneda) /
,/ 0
string1 7
>7 8

repository9 C
,C D
IStringLocalizer 
< &
AdministrativeUnitResource 7
>7 8
	localizer9 B
)B C
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
	localizer 
= 
	localizer &
;& '
} 	
public 
async 
Task 
ValidateCreateAsync -
(- .
string. 4
input5 :
): ;
{ 	
var!! 
exist!! 
=!! 
await!! 

repository!! (
.!!( )
AnyAsync!!) 1
(!!1 2
e!!2 3
=>!!4 6
e!!7 8
.!!8 9
Id!!9 ;
.!!; <
ToUpper!!< C
(!!C D
)!!D E
==!!F H
input!!I N
.!!N O
ToUpper!!O V
(!!V W
)!!W X
)!!X Y
;!!Y Z
if"" 
("" 
exist"" 
)"" 
{## 
var$$ 
msg$$ 
=$$ 
string$$  
.$$  !
Format$$! '
($$' (
	localizer$$( 1
[$$1 2
$str$$2 B
]$$B C
,$$C D
input$$E J
)$$J K
;$$K L
throw%% 
new%% !
UserFriendlyException%% /
(%%/ 0
msg%%0 3
)%%3 4
;%%4 5
}&& 
}'' 	
}(( 
},, Ω
dD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\UnidadAdministrativa\Nivel.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

class 
Nivel 
: 
Entity 
<  
string  &
>& '
{ 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
LevelConsts !
.! "
MaxLevelIdLength" 2
)2 3
]3 4
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @
Alfanumericos@ M
)M N
]N O
public 
override 
string 
Id !
{" #
get$ '
;' (
	protected) 2
set3 6
;6 7
}8 9
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxNameLength) 6
)6 7
]7 8
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @,
 AlfanumericosGuionesPuntoEspacio@ `
)` a
]a b
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
	protected 
Nivel 
( 
) 
{ 	
} 	
public 
Nivel 
( 
string 
id 
) 
:	 

base 
( 
id 
) 
{ 	
}!! 	
}"" 
}## ∂
kD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\UnidadAdministrativa\NivelManager.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{		 
public

 

class

 
NivelManager

 
:

 
DomainService

  -
{ 
private 
readonly 
IStringLocalizer )
<) *&
AdministrativeUnitResource* D
>D E
	localizerF O
;O P
private 
readonly 
IRepository $
<$ %
Nivel% *
,* +
string, 2
>2 3

repository4 >
;> ?
public 
NivelManager 
( 
IRepository '
<' (
Nivel( -
,- .
string/ 5
>5 6

repository7 A
,A B
IStringLocalizer 
< &
AdministrativeUnitResource 7
>7 8
	localizer9 B
)B C
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
	localizer 
= 
	localizer &
;& '
} 	
public 
async 
Task 
ValidateCreateAsync -
(- .
string. 4
input5 :
): ;
{ 	
var 
exist 
= 
await 

repository (
.( )
AnyAsync) 1
(1 2
e2 3
=>4 6
e7 8
.8 9
Id9 ;
.; <
ToUpper< C
(C D
)D E
==F H
inputI N
.N O
ToUpperO V
(V W
)W X
)X Y
;Y Z
if 
( 
exist 
) 
{ 
var 
msg 
= 
string  
.  !
Format! '
(' (
	localizer( 1
[1 2
$str2 ?
]? @
,@ A
inputB G
)G H
;H I
throw   
new   !
UserFriendlyException   /
(  / 0
msg  0 3
)  3 4
;  4 5
}!! 
}"" 	
}## 
}'' å
âD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\UnidadAdministrativa\Repository\IUnidadAdministrativaRepository.csÑ
iD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\UnidadAdministrativa\Signatario.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public

 

class

 

Signatario

 
:

 
Entity

 $
{

% &
	protected 

Signatario 
( 
) 
{ 	
} 	
public 

Signatario 
( 
Guid  
administrativeUnitId 3
,3 4
Guid5 9
userId: @
,@ A
GuidB F
	serviceIdG P
,P Q
boolR V

porDefectoW a
=a b
falseb g
)g h
{ 	"
UnidadAdministrativaId "
=# $ 
administrativeUnitId% 9
;9 :
	UsuarioId 
= 
userId 
; 

ServicioId 
= 
	serviceId "
;" #

PorDefecto 
= 

porDefecto #
;# $
} 	
[ 	
Required	 
] 
public 
Guid "
UnidadAdministrativaId *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
[ 	
Required	 
] 
public 
Guid 
	UsuarioId 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Required	 
] 
public 
Guid 

ServicioId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public$$ 
virtual$$ 
bool$$ 

PorDefecto$$ &
{$$' (
get$$) ,
;$$, -
set$$. 1
;$$1 2
}$$3 4
public'' 
override'' 
object'' 
['' 
]''  
GetKeys''! (
(''( )
)'') *
{(( 	
return)) 
new)) 
object)) 
[)) 
])) 
{))  !"
UnidadAdministrativaId))" 8
,))8 9
	UsuarioId)): C
,))C D

ServicioId))E O
}))P Q
;))Q R
}** 	
},, 
}.. ã
qD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\UnidadAdministrativa\TipoCuentaBancaria.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public		 

class		 
TipoCuentaBancaria		 #
:		$ %
Entity		& ,
<		, -
string		- 3
>		3 4
{

 
[ 	
Required	 
] 
[ 	
StringLength	 
( $
TipoCuentaBancariaConsts .
.. /)
MaxTipoCuentaBancariaIdLength/ L
)L M
]M N
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @
Alfanumericos@ M
)M N
]N O
public 
override 
string 
Id !
{" #
get$ '
;' (
	protected) 2
set3 6
;6 7
}8 9
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxNameLength) 6
)6 7
]7 8
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @,
 AlfanumericosGuionesPuntoEspacio@ `
)` a
]a b
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
	protected 
TipoCuentaBancaria $
($ %
)% &
{ 	
} 	
public 
TipoCuentaBancaria !
(! "
string" (
id) +
)+ ,
:	 

base 
( 
id 
) 
{ 	
} 	
}   
}!! ˜
xD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\UnidadAdministrativa\TipoCuentaBancariaManager.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

class %
TipoCuentaBancariaManager *
:+ ,
DomainService- :
{ 
private 
readonly 
IStringLocalizer )
<) *&
AdministrativeUnitResource* D
>D E
	localizerF O
;O P
private 
readonly 
IRepository $
<$ %
TipoCuentaBancaria% 7
,7 8
string9 ?
>? @

repositoryA K
;K L
public %
TipoCuentaBancariaManager (
(( )
IRepository) 4
<4 5
TipoCuentaBancaria5 G
,G H
stringI O
>O P

repositoryQ [
,[ \
IStringLocalizer 
< &
AdministrativeUnitResource 7
>7 8
	localizer9 B
)B C
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
	localizer 
= 
	localizer &
;& '
} 	
public 
async 
Task 
ValidateCreateAsync -
(- .
string. 4
input5 :
): ;
{ 	
var   
exist   
=   
await   

repository   (
.  ( )
AnyAsync  ) 1
(  1 2
e  2 3
=>  4 6
e  7 8
.  8 9
Id  9 ;
.  ; <
ToUpper  < C
(  C D
)  D E
==  F H
input  I N
.  N O
ToUpper  O V
(  V W
)  W X
)  X Y
;  Y Z
if!! 
(!! 
exist!! 
)!! 
{"" 
var## 
msg## 
=## 
string##  
.##  !
Format##! '
(##' (
	localizer##( 1
[##1 2
$str##2 L
]##L M
,##M N
input##O T
)##T U
;##U V
throw$$ 
new$$ !
UserFriendlyException$$ /
($$/ 0
msg$$0 3
)$$3 4
;$$4 5
}%% 
}&& 	
}'' 
}** ™
wD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\UnidadAdministrativa\TipoUnidadAdministrativa.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

class $
TipoUnidadAdministrativa )
:* +
Entity, 2
<2 3
string3 9
>9 :
{ 
[

 	
Required

	 
]

 
[ 	
StringLength	 
( (
AdministrativeUnitTypeConsts 2
.2 3
MaxIdLength3 >
)> ?
]? @
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @
Alfanumericos@ M
)M N
]N O
public 
override 
string 
Id !
{" #
get$ '
;' (
	protected) 2
set3 6
;6 7
}8 9
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxNameLength) 6
)6 7
]7 8
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @,
 AlfanumericosGuionesPuntoEspacio@ `
)` a
]a b
public 
virtual 
string 
Nombre $
{% &
get' *
;* +
set, /
;/ 0
}1 2
	protected $
TipoUnidadAdministrativa *
(* +
)+ ,
{ 	
} 	
public $
TipoUnidadAdministrativa '
(' (
string( .
id/ 1
)1 2
:	 

base 
( 
id 
) 
{ 	
} 	
}   
}%% ™
~D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\UnidadAdministrativa\TipoUnidadAdministrativaManager.cs
	namespace		 	
Mre		
 
.		 
Sb		 
.		  
UnidadAdministrativa		 %
.		% &
Dominio		& -
{

 
public 

class +
TipoUnidadAdministrativaManager 0
:1 2
DomainService3 @
{ 
private 
readonly 
IStringLocalizer )
<) *&
AdministrativeUnitResource* D
>D E
	localizerF O
;O P
private 
readonly 
IRepository $
<$ %$
TipoUnidadAdministrativa% =
,= >
string? E
>E F

repositoryG Q
;Q R
public +
TipoUnidadAdministrativaManager .
(. /
IRepository/ :
<: ;$
TipoUnidadAdministrativa; S
,S T
stringU [
>[ \

repository] g
,g h
IStringLocalizer 
< &
AdministrativeUnitResource 7
>7 8
	localizer9 B
)B C
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
	localizer 
= 
	localizer &
;& '
} 	
public 
async 
virtual 
Task !
ValidateCreateAsync" 5
(5 6
string6 <
input= B
)B C
{D E
var 
exist 
= 
await 

repository (
.( )
AnyAsync) 1
(1 2
e2 3
=>4 6
e7 8
.8 9
Id9 ;
.; <
ToUpper< C
(C D
)D E
==F H
inputI N
.N O
ToUpperO V
(V W
)W X
)X Y
;Y Z
if 
( 
exist 
) 
{ 
var 
msg 
= 
string  
.  !
Format! '
(' (
	localizer( 1
[1 2
$str2 P
]P Q
,Q R
inputS X
)X Y
;Y Z
throw   
new   !
UserFriendlyException   /
(  / 0
msg  0 3
)  3 4
;  4 5
}!! 
}"" 	
}## 
}++ ı¥
sD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\UnidadAdministrativa\UnidadAdministrativa.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{		 
public 

class  
UnidadAdministrativa %
:& '$
FullAuditedAggregateRoot( @
<@ A
GuidA E
>E F
{G H
	protected  
UnidadAdministrativa &
(& '
)' (
{ 	
} 	
public  
UnidadAdministrativa #
(# $
Guid$ (
id) +
,+ ,
string- 3
name4 8
,8 9
string: @$
administrativeUnitTypeIdA Y
,Y Z
Guid[ _
?_ `&
administrativeDependencyIda {
,{ |
string	} É
acronym
Ñ ã
,
ã å
string
ç ì
	countryId
î ù
,
ù û
string
ü •
regionId
¶ Æ
,
Æ Ø
string
∞ ∂
city
∑ ª
,
ª º
string
Ω √
address
ƒ À
,
À Ã
string
Õ ”
zipCode
‘ €
,
€ ‹
string
› „
bankId
‰ Í
,
Í Î
string
Ï Ú

currencyId
Û ˝
,
˝ ˛
DateTime
ˇ á
?
á à 
operationStartDate
â õ
,
õ ú
DateTime
ù •
?
• ¶
operationEndDate
ß ∑
,
∑ ∏
string
π ø
levelId
¿ «
,
« »
bool
… Õ
isActive
Œ ÷
,
÷ ◊
string
ÿ ﬁ
observations
ﬂ Î
,
Î Ï
string
Ì Û"
tipoCuentaBancariaId
Ù à
,
à â
string
ä ê#
titularCuentaBancaria
ë ¶
,
¶ ß
string
® Æ"
numeroCuentaBancaria
Ø √
,
√ ƒ
string
≈ À
codigo
Ã “
)
“ ”
{ 	
Id 
= 
id 
; &
TipoUnidadAdministrativaId &
=' ($
administrativeUnitTypeId) A
;A B'
DependenciaAdministrativaId '
=( )&
administrativeDependencyId* D
;D E
Nombre 
= 
name 
; 
Siglas 
= 
acronym 
; 
PaisId 
= 
	countryId 
; 
RegionId 
= 
regionId 
;  
Ciudad   
=   
city   
;   
	Direccion!! 
=!! 
address!! 
;!!  
CodigoPostal"" 
="" 
zipCode"" "
;""" #
MonedaId$$ 
=$$ 

currencyId$$ !
;$$! " 
FechaInicioOperacion%%  
=%%! "
operationStartDate%%# 5
;%%5 6
FechaFinOperacion&& 
=&& 
operationEndDate&&  0
;&&0 1
Activo'' 
='' 
isActive'' 
;'' 
NivelId(( 
=(( 
levelId(( 
;(( 
Observaciones)) 
=)) 
observations)) (
;))( )
BancoId,, 
=,, 
bankId,, 
;,,  
TipoCuentaBancariaId--  
=--! " 
tipoCuentaBancariaId--# 7
;--7 8!
TitularCuentaBancaria.. !
=.." #!
titularCuentaBancaria..$ 9
;..9 : 
NumeroCuentaBancaria//  
=//! " 
numeroCuentaBancaria//# 7
;//7 8
Codigo00 
=00 
codigo00 
;00 
}11 	
[33 	
Required33	 
]33 
public44 
string44 &
TipoUnidadAdministrativaId44 0
{441 2
get443 6
;446 7
set448 ;
;44; <
}44= >
public66 $
TipoUnidadAdministrativa66 '$
TipoUnidadAdministrativa66( @
{66A B
get66C F
;66F G
set66H K
;66K L
}66M N
public88 
Guid88 
?88 '
DependenciaAdministrativaId88 0
{881 2
get883 6
;886 7
set888 ;
;88; <
}88= >
public::  
UnidadAdministrativa:: #%
DependenciaAdministrativa::$ =
{::> ?
get::@ C
;::C D
set::E H
;::H I
}::J K
[<< 	
Required<<	 
]<< 
[== 	
StringLength==	 
(== &
UnidadAdministrativaConsts== 0
.==0 1
MaxCodigoLength==1 @
)==@ A
]==A B
[>> 	
RegularExpression>>	 
(>> 
DomainCommonConsts>> -
.>>- .
ExpressionRegular>>. ?
.>>? @
Alfanumericos>>@ M
)>>M N
]>>N O
public?? 
virtual?? 
string?? 
Codigo?? $
{??% &
get??' *
;??* +
	protected??, 5
set??6 9
;??9 :
}??; <
[AA 	
RequiredAA	 
]AA 
[BB 	
StringLengthBB	 
(BB 
DomainCommonConstsBB (
.BB( )
MaxNameLengthBB) 6
)BB6 7
]BB7 8
[CC 	
RegularExpressionCC	 
(CC 
DomainCommonConstsCC -
.CC- .
ExpressionRegularCC. ?
.CC? @,
 AlfanumericosGuionesPuntoEspacioCC@ `
)CC` a
]CCa b
publicDD 
virtualDD 
stringDD 
NombreDD $
{DD% &
getDD' *
;DD* +
	protectedDD, 5
setDD6 9
;DD9 :
}DD; <
[FF 	
RequiredFF	 
]FF 
[GG 	
StringLengthGG	 
(GG &
UnidadAdministrativaConstsGG 0
.GG0 1
MaxAcronymLengthGG1 A
)GGA B
]GGB C
publicHH 
virtualHH 
stringHH 
SiglasHH $
{HH% &
getHH' *
;HH* +
	protectedHH, 5
setHH6 9
;HH9 :
}HH; <
[KK 	
RequiredKK	 
]KK 
[LL 	
StringLengthLL	 
(LL 
DomainCommonConstsLL (
.LL( )#
MaxGeographicalIdLengthLL) @
)LL@ A
]LLA B
publicMM 
stringMM 
PaisIdMM 
{MM 
getMM "
;MM" #
setMM% (
;MM( )
}MM* +
[QQ 	
RequiredQQ	 
]QQ 
[RR 	
StringLengthRR	 
(RR 
DomainCommonConstsRR (
.RR( )#
MaxGeographicalIdLengthRR) @
)RR@ A
]RRA B
publicSS 
stringSS 
RegionIdSS 
{SS  
getSS! $
;SS$ %
setSS' *
;SS* +
}SS, -
[VV 	
RequiredVV	 
]VV 
[WW 	
StringLengthWW	 
(WW 
DomainCommonConstsWW (
.WW( )
MaxAddressLengthWW) 9
)WW9 :
]WW: ;
publicXX 
stringXX 
CiudadXX 
{XX 
getXX "
;XX" #
setXX$ '
;XX' (
}XX) *
[[[ 	
StringLength[[	 
([[ 
DomainCommonConsts[[ (
.[[( )
MaxAddressLength[[) 9
)[[9 :
][[: ;
public\\ 
string\\ 
	Direccion\\ 
{\\  !
get\\" %
;\\% &
set\\( +
;\\+ ,
}\\- .
[__ 	
StringLength__	 
(__ &
UnidadAdministrativaConsts__ 0
.__0 1
MaxCodigoPostal__1 @
)__@ A
]__A B
public`` 
string`` 
CodigoPostal`` "
{``# $
get``% (
;``( )
set``+ .
;``. /
}``0 1
[cc 	
Requiredcc	 
]cc 
publicdd 
stringdd 
BancoIddd 
{dd 
getdd  #
;dd# $
setdd% (
;dd( )
}dd* +
publicgg 
Bancogg 
Bancogg 
{gg 
getgg  
;gg  !
setgg" %
;gg% &
}gg' (
[ii 	
Requiredii	 
]ii 
[jj 	
StringLengthjj	 
(jj &
UnidadAdministrativaConstsjj 0
.jj0 1)
MaxNumeroCuentaBancariaLengthjj1 N
)jjN O
]jjO P
publickk 
stringkk  
NumeroCuentaBancariakk *
{kk+ ,
getkk- 0
;kk0 1
setkk2 5
;kk5 6
}kk7 8
[mm 	
Requiredmm	 
]mm 
publicnn 
stringnn  
TipoCuentaBancariaIdnn *
{nn+ ,
getnn- 0
;nn0 1
setnn2 5
;nn5 6
}nn7 8
publicpp 
TipoCuentaBancariapp !
TipoCuentaBancariapp" 4
{pp5 6
getpp7 :
;pp: ;
setpp< ?
;pp? @
}ppA B
[ss 	
Requiredss	 
]ss 
[tt 	
StringLengthtt	 
(tt &
UnidadAdministrativaConststt 0
.tt0 1*
MaxTitularCuentaBancariaLengthtt1 O
)ttO P
]ttP Q
[uu 	
RegularExpressionuu	 
(uu 
DomainCommonConstsuu -
.uu- .
ExpressionRegularuu. ?
.uu? @,
 AlfanumericosGuionesPuntoEspaciouu@ `
)uu` a
]uua b
publicvv 
stringvv !
TitularCuentaBancariavv +
{vv, -
getvv. 1
;vv1 2
setvv3 6
;vv6 7
}vv8 9
[xx 	
Requiredxx	 
]xx 
publicyy 
stringyy 
MonedaIdyy 
{yy  
getyy! $
;yy$ %
setyy& )
;yy) *
}yy+ ,
public|| 
Moneda|| 
Moneda|| 
{|| 
get|| "
;||" #
set||$ '
;||' (
}||) *
public 
DateTime 
?  
FechaInicioOperacion -
{. /
get0 3
;3 4
set6 9
;9 :
}; <
public
ÅÅ 
DateTime
ÅÅ 
?
ÅÅ 
FechaFinOperacion
ÅÅ *
{
ÅÅ+ ,
get
ÅÅ- 0
;
ÅÅ0 1
set
ÅÅ3 6
;
ÅÅ6 7
}
ÅÅ8 9
public
ÉÉ 
bool
ÉÉ 
Activo
ÉÉ 
{
ÉÉ 
get
ÉÉ  
;
ÉÉ  !
set
ÉÉ" %
;
ÉÉ% &
}
ÉÉ' (
public
ÖÖ 
string
ÖÖ 
NivelId
ÖÖ 
{
ÖÖ 
get
ÖÖ  #
;
ÖÖ# $
set
ÖÖ% (
;
ÖÖ( )
}
ÖÖ* +
public
áá 
Nivel
áá 
Nivel
áá 
{
áá 
get
áá  
;
áá  !
set
áá" %
;
áá% &
}
áá' (
public
ää 
string
ää 
Observaciones
ää #
{
ää$ %
get
ää& )
;
ää) *
set
ää+ .
;
ää. /
}
ää0 1
public
çç 
Guid
çç 
?
çç 
JefeMisionId
çç !
{
çç" #
get
çç$ '
;
çç' (
set
çç) ,
;
çç, -
}
çç. /
public
êê 
virtual
êê 
ICollection
êê "
<
êê" #-
UnidadAdministrativaFuncionario
êê# B
>
êêB C
Funcionarios
êêD P
{
êêQ R
get
êêS V
;
êêV W
	protected
êêX a
set
êêb e
;
êêe f
}
êêg h
=
êêi j
new
êêk n
List
êêo s
<
êês t.
UnidadAdministrativaFuncionarioêêt ì
>êêì î
(êêî ï
)êêï ñ
;êêñ ó
public
ìì 
virtual
ìì 
ICollection
ìì "
<
ìì" #*
UnidadAdministrativaServicio
ìì# ?
>
ìì? @
	Servicios
ììA J
{
ììK L
get
ììM P
;
ììP Q
	protected
ììR [
set
ìì\ _
;
ìì_ `
}
ììa b
=
ììc d
new
ììe h
List
ììi m
<
ììm n+
UnidadAdministrativaServicioììn ä
>ììä ã
(ììã å
)ììå ç
;ììç é
public
ññ 
virtual
ññ 
ICollection
ññ "
<
ññ" #
Jurisdiccion
ññ# /
>
ññ/ 0
Jurisdiccion
ññ1 =
{
ññ> ?
get
ññ@ C
;
ññC D
	protected
ññE N
set
ññO R
;
ññR S
}
ññT U
=
ññV W
new
ññX [
List
ññ\ `
<
ññ` a
Jurisdiccion
ñña m
>
ññm n
(
ññn o
)
ñño p
;
ññp q
public
ôô 
virtual
ôô 
ICollection
ôô "
<
ôô" #

Signatario
ôô# -
>
ôô- .
Signatarios
ôô/ :
{
ôô; <
get
ôô= @
;
ôô@ A
	protected
ôôB K
set
ôôL O
;
ôôO P
}
ôôQ R
=
ôôS T
new
ôôU X
List
ôôY ]
<
ôô] ^

Signatario
ôô^ h
>
ôôh i
(
ôôi j
)
ôôj k
;
ôôk l
public
úú 
void
úú  
AgregarFuncionario
úú &
(
úú& '
Guid
úú' +
	usuarioId
úú, 5
,
úú5 6
string
úú7 =
cargoId
úú> E
)
úúE F
{
ùù 	
Check
ûû 
.
ûû 
NotNull
ûû 
(
ûû 
	usuarioId
ûû #
,
ûû# $
nameof
ûû% +
(
ûû+ ,
	usuarioId
ûû, 5
)
ûû5 6
)
ûû6 7
;
ûû7 8
Check
üü 
.
üü 
NotNull
üü 
(
üü 
cargoId
üü !
,
üü! "
nameof
üü# )
(
üü) *
cargoId
üü* 1
)
üü1 2
)
üü2 3
;
üü3 4
Funcionarios
°° 
.
°° 
Add
°° 
(
°° 
new
°°  -
UnidadAdministrativaFuncionario
°°! @
(
°°@ A
this
°°A E
.
°°E F
Id
°°F H
,
°°H I
	usuarioId
°°J S
,
°°S T
cargoId
°°U \
)
°°\ ]
)
°°] ^
;
°°^ _
}
¢¢ 	
public
§§ 
void
§§ !
EliminarFuncionario
§§ '
(
§§' (
Guid
§§( ,
	usuarioId
§§- 6
)
§§6 7
{
•• 	
Funcionarios
¶¶ 
.
¶¶ 
	RemoveAll
¶¶ "
(
¶¶" #
f
¶¶# $
=>
¶¶% '
f
¶¶( )
.
¶¶) *
	UsuarioId
¶¶* 3
==
¶¶4 6
	usuarioId
¶¶7 @
)
¶¶@ A
;
¶¶A B
}
ßß 	
public
©© 
void
©© 
AgregarServicio
©© #
(
©©# $
Guid
©©$ (
	serviceId
©©) 2
,
©©2 3
string
©©4 :
paymentTypeId
©©; H
,
©©H I
bool
©©J N
isActive
©©O W
)
©©W X
{
™™ 	
Check
´´ 
.
´´ 
NotNull
´´ 
(
´´ 
	serviceId
´´ #
,
´´# $
nameof
´´% +
(
´´+ ,
	serviceId
´´, 5
)
´´5 6
)
´´6 7
;
´´7 8
Check
¨¨ 
.
¨¨ 
NotNull
¨¨ 
(
¨¨ 
paymentTypeId
¨¨ '
,
¨¨' (
nameof
¨¨) /
(
¨¨/ 0
paymentTypeId
¨¨0 =
)
¨¨= >
)
¨¨> ?
;
¨¨? @
	Servicios
ÆÆ 
.
ÆÆ 
Add
ÆÆ 
(
ÆÆ 
new
ÆÆ *
UnidadAdministrativaServicio
ÆÆ :
(
ÆÆ: ;
this
ÆÆ; ?
.
ÆÆ? @
Id
ÆÆ@ B
,
ÆÆB C
	serviceId
ÆÆD M
,
ÆÆM N
paymentTypeId
ÆÆO \
,
ÆÆ\ ]
isActive
ÆÆ^ f
)
ÆÆf g
)
ÆÆg h
;
ÆÆh i
}
ØØ 	
public
±± 
void
±± 
EliminarServicio
±± $
(
±±$ %
Guid
±±% )
	serviceId
±±* 3
)
±±3 4
{
≤≤ 	
	Servicios
≥≥ 
.
≥≥ 
	RemoveAll
≥≥  
(
≥≥  !
s
≥≥! "
=>
≥≥# %
s
≥≥& '
.
≥≥' (

ServicioId
≥≥( 2
==
≥≥3 5
	serviceId
≥≥6 ?
)
≥≥? @
;
≥≥@ A
}
µµ 	
public
∑∑ 
void
∑∑ 
CambiarNombre
∑∑ !
(
∑∑! "
string
∑∑" (
newName
∑∑) 0
)
∑∑0 1
{
∏∏ 	
this
ππ 
.
ππ 
Nombre
ππ 
=
ππ 
newName
ππ !
;
ππ! "
}
∫∫ 	
public
ºº 
void
ºº 
ChangeState
ºº 
(
ºº  
bool
ºº  $
isActive
ºº% -
)
ºº- .
{
ΩΩ 	
this
ææ 
.
ææ 
Activo
ææ 
=
ææ 
isActive
ææ "
;
ææ" #
}
øø 	
public
¡¡ 
void
¡¡ 
CambiarSigla
¡¡  
(
¡¡  !
string
¡¡! '
sigla
¡¡( -
)
¡¡- .
{
¬¬ 	
this
√√ 
.
√√ 
Siglas
√√ 
=
√√ 
sigla
√√ 
;
√√  
}
ƒƒ 	
public
∆∆ 
void
∆∆ 
CambiarCodigo
∆∆ !
(
∆∆! "
string
∆∆" (
codigo
∆∆) /
)
∆∆/ 0
{
«« 	
this
»» 
.
»» 
Codigo
»» 
=
»» 
codigo
»»  
;
»»  !
}
…… 	
public
ÀÀ 
void
ÀÀ 
AddMissionChief
ÀÀ #
(
ÀÀ# $
Guid
ÀÀ$ (
jefeMisionId
ÀÀ) 5
)
ÀÀ5 6
{
ÃÃ 	
JefeMisionId
ÕÕ 
=
ÕÕ 
jefeMisionId
ÕÕ '
;
ÕÕ' (
}
ŒŒ 	
public
–– 
void
–– 
AgregarSignatario
–– %
(
––% &
Guid
––& *
userId
––+ 1
,
––1 2
Guid
––3 7
	serviceId
––8 A
,
––A B
bool
––C G

porDefecto
––H R
=
––S T
false
––U Z
)
––Z [
{
—— 	
Check
““ 
.
““ 
NotNull
““ 
(
““ 
	serviceId
““ #
,
““# $
nameof
““% +
(
““+ ,
	serviceId
““, 5
)
““5 6
)
““6 7
;
““7 8
Check
”” 
.
”” 
NotNull
”” 
(
”” 
userId
””  
,
””  !
nameof
””" (
(
””( )
userId
””) /
)
””/ 0
)
””0 1
;
””1 2
Signatarios
’’ 
.
’’ 
Add
’’ 
(
’’ 
new
’’ 

Signatario
’’  *
(
’’* +
this
’’+ /
.
’’/ 0
Id
’’0 2
,
’’2 3
userId
’’4 :
,
’’: ;
	serviceId
’’< E
,
’’E F

porDefecto
’’G Q
)
’’Q R
)
’’R S
;
’’S T
}
÷÷ 	
public
ÿÿ 
void
ÿÿ  
EliminarSignatario
ÿÿ &
(
ÿÿ& '
Guid
ÿÿ' +
userId
ÿÿ, 2
,
ÿÿ2 3
Guid
ÿÿ4 8
	serviceId
ÿÿ9 B
)
ÿÿB C
{
ŸŸ 	
Signatarios
⁄⁄ 
.
⁄⁄ 
	RemoveAll
⁄⁄ !
(
⁄⁄! "
s
⁄⁄" #
=>
⁄⁄$ &
s
⁄⁄' (
.
⁄⁄( )
	UsuarioId
⁄⁄) 2
==
⁄⁄3 5
userId
⁄⁄6 <
&&
⁄⁄= ?
s
⁄⁄@ A
.
⁄⁄A B

ServicioId
⁄⁄B L
==
⁄⁄M O
	serviceId
⁄⁄P Y
)
⁄⁄Y Z
;
⁄⁄Z [
}
€€ 	
public
ﬁﬁ 
void
ﬁﬁ !
AgregarJurisdiccion
ﬁﬁ '
(
ﬁﬁ' (
IEnumerable
ﬁﬁ( 3
<
ﬁﬁ3 4
string
ﬁﬁ4 :
>
ﬁﬁ: ;"
ciudadesJurisdiccion
ﬁﬁ< P
)
ﬁﬁP Q
{
ﬂﬂ 	
Check
‡‡ 
.
‡‡ 
NotNull
‡‡ 
(
‡‡ "
ciudadesJurisdiccion
‡‡ .
,
‡‡. /
nameof
‡‡0 6
(
‡‡6 7"
ciudadesJurisdiccion
‡‡7 K
)
‡‡K L
)
‡‡L M
;
‡‡M N
foreach
‚‚ 
(
‚‚ 
var
‚‚ 
ciudad
‚‚ 
in
‚‚  ""
ciudadesJurisdiccion
‚‚# 7
)
‚‚7 8
{
„„ 
Jurisdiccion
‰‰ 
.
‰‰ 
Add
‰‰  
(
‰‰  !
new
‰‰! $
Jurisdiccion
‰‰% 1
(
‰‰1 2
this
‰‰2 6
.
‰‰6 7
Id
‰‰7 9
,
‰‰9 :
ciudad
‰‰; A
)
‰‰A B
)
‰‰B C
;
‰‰C D
}
ÂÂ 
}
ÁÁ 	
public
ÈÈ 
void
ÈÈ "
EliminarJurisdiccion
ÈÈ (
(
ÈÈ( )
IEnumerable
ÈÈ) 4
<
ÈÈ4 5
string
ÈÈ5 ;
>
ÈÈ; <"
ciudadesJurisdiccion
ÈÈ= Q
)
ÈÈQ R
{
ÍÍ 	
Check
ÎÎ 
.
ÎÎ 
NotNull
ÎÎ 
(
ÎÎ "
ciudadesJurisdiccion
ÎÎ /
,
ÎÎ/ 0
nameof
ÎÎ1 7
(
ÎÎ7 8"
ciudadesJurisdiccion
ÎÎ8 L
)
ÎÎL M
)
ÎÎM N
;
ÎÎN O
var
ÌÌ "
jurisdiccionEliminar
ÌÌ $
=
ÌÌ% &
new
ÌÌ' *
List
ÌÌ+ /
<
ÌÌ/ 0
Jurisdiccion
ÌÌ0 <
>
ÌÌ< =
(
ÌÌ= >
)
ÌÌ> ?
;
ÌÌ? @
foreach
ÓÓ 
(
ÓÓ 
var
ÓÓ 
ciudad
ÓÓ 
in
ÓÓ  ""
ciudadesJurisdiccion
ÓÓ# 7
)
ÓÓ7 8
{
ÔÔ 
var
 
jurisdiccion
  
=
! "
Jurisdiccion
# /
.
/ 0
SingleOrDefault
0 ?
(
? @
j
@ A
=>
B D
j
E F
.
F G
Ciudad
G M
==
N P
ciudad
Q W
.
W X
ToUpper
X _
(
_ `
)
` a
)
a b
;
b c
if
ÒÒ 
(
ÒÒ 
jurisdiccion
ÒÒ  
==
ÒÒ! #
null
ÒÒ$ (
)
ÒÒ( )
{
ÒÒ* +
throw
ÚÚ 
new
ÚÚ #
UserFriendlyException
ÚÚ 3
(
ÚÚ3 4
string
ÚÚ4 :
.
ÚÚ: ;
Format
ÚÚ; A
(
ÚÚA B
$str
ÚÚB {
,
ÚÚ{ |
CiudadÚÚ} É
)ÚÚÉ Ñ
)ÚÚÑ Ö
;ÚÚÖ Ü
}
ÛÛ "
jurisdiccionEliminar
ÙÙ $
.
ÙÙ$ %
Add
ÙÙ% (
(
ÙÙ( )
jurisdiccion
ÙÙ) 5
)
ÙÙ5 6
;
ÙÙ6 7
}
ˆˆ 
if
¯¯ 
(
¯¯ "
jurisdiccionEliminar
¯¯ $
.
¯¯$ %
Any
¯¯% (
(
¯¯( )
)
¯¯) *
)
¯¯* +
{
¯¯, -
Jurisdiccion
˘˘ 
.
˘˘ 
	RemoveAll
˘˘ &
(
˘˘& '"
jurisdiccionEliminar
˘˘' ;
)
˘˘; <
;
˘˘< =
}
˙˙ 
}
˚˚ 	
}
˝˝ 
}˛˛ Û
~D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\UnidadAdministrativa\UnidadAdministrativaFuncionario.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

class +
UnidadAdministrativaFuncionario 0
:1 2
Entity3 9
{: ;
	protected		 +
UnidadAdministrativaFuncionario		 1
(		1 2
)		2 3
{

 	
} 	
public +
UnidadAdministrativaFuncionario .
(. /
Guid/ 3"
unidadAdministrativaId4 J
,J K
GuidL P
	usuarioIdQ Z
,Z [
string\ b
cargoIdc j
)j k
{ 	"
UnidadAdministrativaId "
=# $"
unidadAdministrativaId% ;
;; <
	UsuarioId 
= 
	usuarioId !
;! "
CargoId 
= 
cargoId 
; 
} 	
[ 	
Required	 
] 
public 
Guid "
UnidadAdministrativaId *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
[ 	
Required	 
] 
public 
Guid 
	UsuarioId 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Required	 
] 
public 
string 
CargoId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
Cargo 
Cargo 
{ 
get  
;  !
set" %
;% &
}' (
public   
override   
object   
[   
]    
GetKeys  ! (
(  ( )
)  ) *
{!! 	
return"" 
new"" 
object"" 
["" 
]"" 
{""  !"
UnidadAdministrativaId""" 8
,""8 9
	UsuarioId"": C
}""D E
;""E F
}## 	
}%% 
}'' ˆ†
zD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\UnidadAdministrativa\UnidadAdministrativaManager.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

class '
UnidadAdministrativaManager ,
:- .
DomainService/ <
{ 
private 
readonly 
IRepository $
<$ %
Dominio% ,
., - 
UnidadAdministrativa- A
,A B
GuidC G
>G H

repositoryI S
;S T
private 
readonly 
IStringLocalizer )
<) *&
AdministrativeUnitResource* D
>D E
	localizerF O
;O P
private 
readonly 
IRepository $
<$ %(
UnidadAdministrativaServicio% A
>A B0
$administrativeUnitServiceRespositoryC g
;g h
private 
readonly 
IRepository $
<$ %+
UnidadAdministrativaFuncionario% D
>D E4
(administrativeUnitFunctionaryRespositoryF n
;n o
private 
readonly 
IRepository $
<$ %

Signatario% /
>/ 0/
#administrativeUnitSignerRespository1 T
;T U
private 
readonly *
ConfiguracionSignatarioManager 7*
configuracionSignatarioManager8 V
;V W
public '
UnidadAdministrativaManager *
(* +
IRepository 
< 
Dominio 
.   
UnidadAdministrativa  4
,4 5
Guid6 :
>: ;

repository< F
,F G
IRepository 
< 
Dominio 
.  (
UnidadAdministrativaServicio  <
>< =0
$administrativeUnitServiceRespository> b
,b c
IRepository 
< +
UnidadAdministrativaFuncionario 7
>7 84
(administrativeUnitFunctionaryRespository9 a
,a b
IRepository 
< 

Signatario "
>" #/
#administrativeUnitSignerRespository$ G
,G H*
ConfiguracionSignatarioManager **
configuracionSignatarioManager+ I
,I J
IStringLocalizer   
<   &
AdministrativeUnitResource   7
>  7 8
	localizer  9 B
)  B C
{!! 	
this"" 
."" 

repository"" 
="" 

repository"" (
;""( )
this## 
.## 0
$administrativeUnitServiceRespository## 5
=##6 70
$administrativeUnitServiceRespository##8 \
;##\ ]
this$$ 
.$$ 
	localizer$$ 
=$$ 
	localizer$$ &
;$$& '
this%% 
.%% 4
(administrativeUnitFunctionaryRespository%% 9
=%%: ;4
(administrativeUnitFunctionaryRespository%%< d
;%%d e
this&& 
.&& /
#administrativeUnitSignerRespository&& 4
=&&5 6/
#administrativeUnitSignerRespository&&7 Z
;&&Z [
this'' 
.'' *
configuracionSignatarioManager'' /
=''0 1*
configuracionSignatarioManager''2 P
;''P Q
}(( 	
public** 
virtual** 
async** 
Task** !
<**! " 
UnidadAdministrativa**" 6
>**6 7

CrearAsync**8 B
(**B C
Guid**C G
id**H J
,**J K
string**L R
name**S W
,**W X
string**Y _
codigo**` f
,**f g
string**h n%
administrativeUnitTypeId	**o á
,
**á à
Guid
**â ç
?
**ç é(
administrativeDependencyId
**è ©
,
**© ™
string
**´ ±
acronym
**≤ π
,
**π ∫
string
**ª ¡
	countryId
**¬ À
,
**À Ã
string
**Õ ”
regionId
**‘ ‹
,
**‹ ›
string
**ﬁ ‰
city
**Â È
,
**È Í
string
**Î Ò
address
**Ú ˘
,
**˘ ˙
string
**˚ Å
zipCode
**Ç â
,
**â ä
string
**ã ë
bankId
**í ò
,
**ò ô
string
**ö †

currencyId
**° ´
,
**´ ¨
DateTime
**≠ µ
?
**µ ∂ 
operationStartDate
**∑ …
,
**…  
DateTime
**À ”
?
**” ‘
operationEndDate
**’ Â
,
**Â Ê
string
**Ë Ó
levelId
**Ô ˆ
,
**ˆ ˜
string
**˘ ˇ"
tipoCuentaBancariaId
**Ä î
,
**î ï
string
**ñ ú#
titularCuentaBancaria
**ù ≤
,
**≤ ≥
string
**¥ ∫"
numeroCuentaBancaria
**ª œ
,
**œ –
bool
**— ’
isActive
**÷ ﬁ
=
**ﬂ ‡
true
**· Â
,
**Â Ê
string
**Á Ì
observations
**Ó ˙
=
**˚ ¸
null
**˝ Å
)
**Å Ç
{++ 	
var.. 
	queryable.. 
=.. 
await.. !

repository.." ,
..., -
GetQueryableAsync..- >
(..> ?
)..? @
;..@ A
var// 
existeNombre// 
=// 
	queryable// (
.//( )
Any//) ,
(//, -
e//- .
=>/// 1
e//2 3
.//3 4
Nombre//4 :
.//: ;
ToUpper//; B
(//B C
)//C D
==//E G
name//H L
)//L M
;//M N
if11 
(11 
existeNombre11 
)11 
{22 
throw33 
new33 !
UserFriendlyException33 /
(33/ 0
string330 6
.336 7
Format337 =
(33= >
	localizer33> G
[33G H
$str33H f
]33f g
,33g h
name33i m
)33m n
)33n o
;33o p
}44 
var55 
existeSiglas55 
=55 
	queryable55 (
.55( )
Any55) ,
(55, -
e55- .
=>55/ 1
e552 3
.553 4
Siglas554 :
.55: ;
ToUpper55; B
(55B C
)55C D
==55E G
acronym55H O
)55O P
;55P Q
if66 
(66 
existeSiglas66 
)66 
{77 
throw88 
new88 !
UserFriendlyException88 /
(88/ 0
string880 6
.886 7
Format887 =
(88= >
	localizer88> G
[88G H
$str88H i
]88i j
,88j k
acronym88l s
)88s t
)88t u
;88u v
}99 
var;; 
existeCodigo;; 
=;; 
	queryable;; (
.;;( )
Any;;) ,
(;;, -
e;;- .
=>;;/ 1
e;;2 3
.;;3 4
Codigo;;4 :
.;;: ;
ToUpper;;; B
(;;B C
);;C D
==;;E G
codigo;;H N
);;N O
;;;O P
if<< 
(<< 
existeCodigo<< 
)<< 
{== 
throw>> 
new>> !
UserFriendlyException>> /
(>>/ 0
string>>0 6
.>>6 7
Format>>7 =
(>>= >
	localizer>>> G
[>>G H
$str>>H i
]>>i j
,>>j k
codigo>>l r
)>>r s
)>>s t
;>>t u
}?? 
varAA 
entityAA 
=AA 
newAA  
UnidadAdministrativaAA 1
(AA1 2
idAA2 4
:AA4 5
idAA6 8
,AA8 9
nameAA: >
:AA> ?
nameAA@ D
,AAD E
codigoAAF L
:AAL M
codigoAAN T
,AAT U$
administrativeUnitTypeIdAAV n
:AAn o%
administrativeUnitTypeId	AAp à
,
AAà â(
administrativeDependencyId
AAä §
:
AA§ •(
administrativeDependencyId
AA¶ ¿
,
AA¿ ¡
acronym
AA¬ …
:
AA…  
acronym
AAÀ “
,
AA“ ”
	countryId
AA‘ ›
:
AA› ﬁ
	countryId
AAﬂ Ë
,
AAË È
regionId
AAÍ Ú
:
AAÚ Û
regionId
AAÙ ¸
,
AA¸ ˝
city
AA˛ Ç
:
AAÇ É
city
AAÉ á
,
AAá à
address
AAâ ê
:
AAê ë
address
AAí ô
,
AAô ö
zipCode
AAõ ¢
:
AA¢ £
zipCode
AA§ ´
,
AA´ ¨
bankId
AA≠ ≥
:
AA≥ ¥
bankId
AAµ ª
,
AAª º

currencyId
AAΩ «
:
AA« »

currencyId
AA… ”
,
AA” ‘ 
operationStartDate
AA’ Á
:
AAÁ Ë 
operationStartDate
AAÈ ˚
,
AA˚ ¸
operationEndDate
AA˝ ç
:
AAç é
operationEndDate
AAè ü
,
AAü †
levelId
AA° ®
:
AA® ©
levelId
AA™ ±
,
AA± ≤
isActive
AA≥ ª
:
AAº Ω
isActive
AAæ ∆
,
AA∆ «
observations
AA» ‘
:
AA‘ ’
observations
AA÷ ‚
,
AA‚ „"
tipoCuentaBancariaId
AAÂ ˘
:
AA˘ ˙"
tipoCuentaBancariaId
AA˚ è
,
AAè ê#
titularCuentaBancaria
AAë ¶
:
AA¶ ß#
titularCuentaBancaria
AA® Ω
,
AAΩ æ"
numeroCuentaBancaria
AAø ”
:
AA” ‘"
numeroCuentaBancaria
AA’ È
)BB 
;BB 
returnFF 
entityFF 
;FF 
}GG 	
publicII 
asyncII 
TaskII 
CambiarNombreAsyncII ,
(II, - 
UnidadAdministrativaJJ #
administrativeUnitJJ$ 6
,JJ6 7
stringKK 
newNameKK 
)KK 
{LL 	
CheckMM 
.MM 
NotNullMM 
(MM 
administrativeUnitMM ,
,MM, -
nameofMM. 4
(MM4 5
administrativeUnitMM5 G
)MMG H
)MMH I
;MMI J
CheckNN 
.NN 
NotNullOrWhiteSpaceNN %
(NN% &
newNameNN& -
,NN- .
nameofNN/ 5
(NN5 6
newNameNN6 =
)NN= >
)NN> ?
;NN? @
varPP 
	queryablePP 
=PP 
awaitPP !

repositoryPP" ,
.PP, -
GetQueryableAsyncPP- >
(PP> ?
)PP? @
;PP@ A
varQQ 
existingQQ 
=QQ 
	queryableQQ $
.QQ$ %
AnyQQ% (
(QQ( )
eQQ) *
=>QQ+ -
eQQ. /
.QQ/ 0
NombreQQ0 6
.QQ6 7
ToUpperQQ7 >
(QQ> ?
)QQ? @
==QQA C
newNameQQD K
.QQK L
ToUpperQQL S
(QQS T
)QQT U
&&QQV X
eRR 
.RR 
IdRR 
!=RR 
administrativeUnitRR .
.RR. /
IdRR/ 1
)RR1 2
;RR2 3
ifTT 
(TT 
existingTT 
)TT 
{UU 
throwVV 
newVV !
UserFriendlyExceptionVV /
(VV/ 0
stringVV0 6
.VV6 7
FormatVV7 =
(VV= >
	localizerVV> G
[VVG H
$strVVH f
]VVf g
,VVg h
newNameVVi p
)VVp q
)VVq r
;VVr s
}WW 
administrativeUnitYY 
.YY 
CambiarNombreYY ,
(YY, -
newNameYY- 4
)YY4 5
;YY5 6
}ZZ 	
public]] 
async]] 
Task]] 
CambiarSiglasAsync]] ,
(]], - 
UnidadAdministrativa^^ "
administrativeUnit^^# 5
,^^5 6
string__ 
nuevaSiglas__  
)__  !
{`` 	
Checkaa 
.aa 
NotNullaa 
(aa 
administrativeUnitaa ,
,aa, -
nameofaa. 4
(aa4 5
administrativeUnitaa5 G
)aaG H
)aaH I
;aaI J
Checkbb 
.bb 
NotNullOrWhiteSpacebb %
(bb% &
nuevaSiglasbb& 1
,bb1 2
nameofbb3 9
(bb9 :
nuevaSiglasbb: E
)bbE F
)bbF G
;bbG H
vardd 
	queryabledd 
=dd 
awaitdd !

repositorydd" ,
.dd, -
GetQueryableAsyncdd- >
(dd> ?
)dd? @
;dd@ A
varee 
existingee 
=ee 
	queryableee $
.ee$ %
Anyee% (
(ee( )
eee) *
=>ee+ -
eee. /
.ee/ 0
Siglasee0 6
.ee6 7
ToUpperee7 >
(ee> ?
)ee? @
==eeA C
nuevaSiglaseeD O
.eeO P
ToUppereeP W
(eeW X
)eeX Y
&&eeZ \
eff 
.ff 
Idff 
!=ff 
administrativeUnitff .
.ff. /
Idff/ 1
)ff1 2
;ff2 3
ifhh 
(hh 
existinghh 
)hh 
{ii 
throwjj 
newjj !
UserFriendlyExceptionjj /
(jj/ 0
stringjj0 6
.jj6 7
Formatjj7 =
(jj= >
	localizerjj> G
[jjG H
$strjjH i
]jji j
,jjj k
nuevaSiglasjjl w
)jjw x
)jjx y
;jjy z
}kk 
administrativeUnitmm 
.mm 
CambiarSiglamm +
(mm+ ,
nuevaSiglasmm, 7
)mm7 8
;mm8 9
}nn 	
publicpp 
asyncpp 
Taskpp 
CambiarCodigoAsyncpp ,
(pp, - 
UnidadAdministrativaqq "
administrativeUnitqq# 5
,qq5 6
stringrr 
nuevoCodigorr  
)rr  !
{ss 	
Checktt 
.tt 
NotNulltt 
(tt 
administrativeUnittt ,
,tt, -
nameoftt. 4
(tt4 5
administrativeUnittt5 G
)ttG H
)ttH I
;ttI J
Checkuu 
.uu 
NotNullOrWhiteSpaceuu %
(uu% &
nuevoCodigouu& 1
,uu1 2
nameofuu3 9
(uu9 :
nuevoCodigouu: E
)uuE F
)uuF G
;uuG H
varww 
	queryableww 
=ww 
awaitww !

repositoryww" ,
.ww, -
GetQueryableAsyncww- >
(ww> ?
)ww? @
;ww@ A
varxx 
existingxx 
=xx 
	queryablexx $
.xx$ %
Anyxx% (
(xx( )
exx) *
=>xx+ -
exx. /
.xx/ 0
Codigoxx0 6
.xx6 7
ToUpperxx7 >
(xx> ?
)xx? @
==xxA C
nuevoCodigoxxD O
.xxO P
ToUpperxxP W
(xxW X
)xxX Y
&&xxZ \
eyy 
.yy 
Idyy 
!=yy 
administrativeUnityy .
.yy. /
Idyy/ 1
)yy1 2
;yy2 3
if{{ 
({{ 
existing{{ 
){{ 
{|| 
throw}} 
new}} !
UserFriendlyException}} /
(}}/ 0
string}}0 6
.}}6 7
Format}}7 =
(}}= >
	localizer}}> G
[}}G H
$str}}H i
]}}i j
,}}j k
nuevoCodigo}}l w
)}}w x
)}}x y
;}}y z
}~~  
administrativeUnit
ÄÄ 
.
ÄÄ 
CambiarCodigo
ÄÄ ,
(
ÄÄ, -
nuevoCodigo
ÄÄ- 8
)
ÄÄ8 9
;
ÄÄ9 :
}
ÅÅ 	
public
ÑÑ 
async
ÑÑ 
Task
ÑÑ 
<
ÑÑ "
UnidadAdministrativa
ÑÑ .
>
ÑÑ. / 
CambiarEstadoAsync
ÑÑ0 B
(
ÑÑB C
Guid
ÑÑC G
id
ÑÑH J
,
ÑÑJ K
bool
ÑÑL P
isActive
ÑÑQ Y
)
ÑÑY Z
{
ÖÖ 	
Check
ÜÜ 
.
ÜÜ 
NotNull
ÜÜ 
(
ÜÜ 
id
ÜÜ 
,
ÜÜ 
nameof
ÜÜ $
(
ÜÜ$ %
id
ÜÜ% '
)
ÜÜ' (
)
ÜÜ( )
;
ÜÜ) *
var
àà  
administrativeUnit
àà "
=
àà# $
await
àà% *

repository
àà+ 5
.
àà5 6
GetAsync
àà6 >
(
àà> ?
id
àà? A
)
ààA B
;
ààB C
var
ãã 
existing
ãã 
=
ãã 
false
ãã  
;
ãã  !
if
çç 
(
çç 
existing
çç 
)
çç 
{
éé 
throw
èè 
new
èè 
AbpException
èè &
(
èè& '
string
èè' -
.
èè- .
Format
èè. 4
(
èè4 5
	localizer
èè5 >
[
èè> ?
$str
èè? i
]
èèi j
,
èèj k 
administrativeUnit
èèl ~
.
èè~ 
Nombreèè Ö
)èèÖ Ü
)èèÜ á
;èèá à
}
êê 
if
íí 
(
íí  
administrativeUnit
íí "
.
íí" #
Activo
íí# )
==
íí* ,
isActive
íí- 5
)
íí5 6
{
ìì 
throw
îî 
new
îî 
AbpException
îî &
(
îî& '
string
îî' -
.
îî- .
Format
îî. 4
(
îî4 5
	localizer
îî5 >
[
îî> ?
$str
îî? `
]
îî` a
,
îîa b
isActive
îîc k
)
îîk l
)
îîl m
;
îîm n
}
ïï  
administrativeUnit
óó 
.
óó 
ChangeState
óó *
(
óó* +
isActive
óó+ 3
)
óó3 4
;
óó4 5
return
ôô  
administrativeUnit
ôô %
;
ôô% &
}
öö 	
public
úú 
async
úú 
Task
úú 
<
úú "
UnidadAdministrativa
úú .
>
úú. /%
AgregarFuncionarioAsync
úú0 G
(
úúG H
Guid
úúH L$
unidadAdministrativaId
úúM c
,
úúc d
Guid
úúe i
	usuarioId
úúj s
,
úús t
string
úúu {

positionIdúú| Ü
)úúÜ á
{
ùù 	
Check
ûû 
.
ûû 
NotNull
ûû 
(
ûû $
unidadAdministrativaId
ûû 0
,
ûû0 1
nameof
ûû2 8
(
ûû8 9$
unidadAdministrativaId
ûû9 O
)
ûûO P
)
ûûP Q
;
ûûQ R
Check
üü 
.
üü 
NotNull
üü 
(
üü 
	usuarioId
üü #
,
üü# $
nameof
üü% +
(
üü+ ,
	usuarioId
üü, 5
)
üü5 6
)
üü6 7
;
üü7 8
var
°° 
consulta
°° 
=
°° 
await
°°  

repository
°°! +
.
°°+ ,
WithDetailsAsync
°°, <
(
°°< =
x
°°= >
=>
°°? A
x
°°B C
.
°°C D
Funcionarios
°°D P
)
°°P Q
;
°°Q R
consulta
¢¢ 
=
¢¢ 
consulta
¢¢ 
.
¢¢  
Where
¢¢  %
(
¢¢% &
au
¢¢& (
=>
¢¢) +
au
¢¢, .
.
¢¢. /
Id
¢¢/ 1
==
¢¢2 4$
unidadAdministrativaId
¢¢5 K
)
¢¢K L
;
¢¢L M
var
§§  
administrativeUnit
§§ "
=
§§# $
await
§§% *
AsyncExecuter
§§+ 8
.
§§8 9"
SingleOrDefaultAsync
§§9 M
(
§§M N
consulta
§§N V
)
§§V W
;
§§W X
if
•• 
(
••  
administrativeUnit
•• "
==
••# %
null
••& *
)
••* +
{
¶¶ 
throw
ßß 
new
ßß %
EntityNotFoundException
ßß 1
(
ßß1 2
typeof
ßß2 8
(
ßß8 9
Mre
ßß9 <
.
ßß< =
Sb
ßß= ?
.
ßß? @"
UnidadAdministrativa
ßß@ T
.
ßßT U
Dominio
ßßU \
.
ßß\ ]"
UnidadAdministrativa
ßß] q
)
ßßq r
,
ßßr s%
unidadAdministrativaIdßßt ä
)ßßä ã
;ßßã å
}
®® 
var
™™ 
exist
™™ 
=
™™ 
await
™™ $
ExisteFuncionarioAsync
™™ 4
(
™™4 5
	usuarioId
™™5 >
)
™™> ?
;
™™? @
if
´´ 
(
´´ 
exist
´´ 
)
´´ 
{
¨¨ 
throw
≠≠ 
new
≠≠ #
UserFriendlyException
≠≠ /
(
≠≠/ 0
string
≠≠0 6
.
≠≠6 7
Format
≠≠7 =
(
≠≠= >
	localizer
≠≠> G
[
≠≠G H
$str
≠≠H m
]
≠≠m n
)
≠≠n o
)
≠≠o p
;
≠≠p q
}
ÆÆ  
administrativeUnit
∞∞ 
.
∞∞  
AgregarFuncionario
∞∞ 1
(
∞∞1 2
	usuarioId
∞∞2 ;
,
∞∞; <

positionId
∞∞= G
)
∞∞G H
;
∞∞H I
return
≤≤  
administrativeUnit
≤≤ %
;
≤≤% &
}
≥≥ 	
public
µµ 
virtual
µµ 
async
µµ 
Task
µµ !
<
µµ! "
bool
µµ" &
>
µµ& '$
ExisteFuncionarioAsync
µµ( >
(
µµ> ?
Guid
µµ? C
userId
µµD J
)
µµJ K
{
∂∂ 	
Check
∑∑ 
.
∑∑ 
NotNull
∑∑ 
(
∑∑ 
userId
∑∑  
,
∑∑  !
nameof
∑∑" (
(
∑∑( )
userId
∑∑) /
)
∑∑/ 0
)
∑∑0 1
;
∑∑1 2
var
ππ 
	queryable
ππ 
=
ππ 
await
ππ !6
(administrativeUnitFunctionaryRespository
ππ" J
.
ππJ K
GetQueryableAsync
ππK \
(
ππ\ ]
)
ππ] ^
;
ππ^ _
	queryable
∫∫ 
=
∫∫ 
	queryable
∫∫ !
.
∫∫! "
Where
∫∫" '
(
∫∫' (
p
∫∫( )
=>
∫∫* ,
p
∫∫- .
.
∫∫. /
	UsuarioId
∫∫/ 8
==
∫∫9 ;
userId
∫∫< B
)
∫∫B C
;
∫∫C D
return
ºº 
	queryable
ºº 
.
ºº 
Any
ºº  
(
ºº  !
)
ºº! "
;
ºº" #
}
ΩΩ 	
public
øø 
async
øø 
Task
øø 
<
øø "
UnidadAdministrativa
øø .
>
øø. /&
EliminarFuncionarioAsync
øø0 H
(
øøH I
Guid
øøI M$
unidadAdministrativaId
øøN d
,
øød e
Guid
øøf j
userId
øøk q
)
øøq r
{
¿¿ 	
Check
¡¡ 
.
¡¡ 
NotNull
¡¡ 
(
¡¡ $
unidadAdministrativaId
¡¡ 0
,
¡¡0 1
nameof
¡¡2 8
(
¡¡8 9$
unidadAdministrativaId
¡¡9 O
)
¡¡O P
)
¡¡P Q
;
¡¡Q R
Check
¬¬ 
.
¬¬ 
NotNull
¬¬ 
(
¬¬ 
userId
¬¬  
,
¬¬  !
nameof
¬¬" (
(
¬¬( )
userId
¬¬) /
)
¬¬/ 0
)
¬¬0 1
;
¬¬1 2
var
ƒƒ $
queryableFunctionaries
ƒƒ &
=
ƒƒ' (
await
ƒƒ) .6
(administrativeUnitFunctionaryRespository
ƒƒ/ W
.
ƒƒW X
GetQueryableAsync
ƒƒX i
(
ƒƒi j
)
ƒƒj k
;
ƒƒk l
var
∆∆  
queryFunctionaries
∆∆ "
=
∆∆# $$
queryableFunctionaries
∆∆% ;
.
∆∆; <
Where
∆∆< A
(
∆∆A B
f
∆∆B C
=>
∆∆D F
f
∆∆G H
.
∆∆H I$
UnidadAdministrativaId
∆∆I _
==
∆∆` b$
unidadAdministrativaId
∆∆c y
&&
∆∆z |
f
∆∆} ~
.
∆∆~ 
	UsuarioId∆∆ à
==∆∆â ã
userId∆∆å í
)∆∆í ì
;∆∆ì î
var
»» +
administrativeUnitFunctionary
»» -
=
»». /
await
»»0 5
AsyncExecuter
»»6 C
.
»»C D!
FirstOrDefaultAsync
»»D W
(
»»W X 
queryFunctionaries
»»X j
)
»»j k
;
»»k l
if
   
(
   +
administrativeUnitFunctionary
   -
==
  . 0
null
  1 5
)
  5 6
{
ÀÀ 
throw
ÃÃ 
new
ÃÃ %
EntityNotFoundException
ÃÃ 1
(
ÃÃ1 2
typeof
ÃÃ2 8
(
ÃÃ8 9-
UnidadAdministrativaFuncionario
ÃÃ9 X
)
ÃÃX Y
,
ÃÃY Z$
unidadAdministrativaId
ÃÃ[ q
)
ÃÃq r
;
ÃÃr s
}
ÕÕ 
var
œœ 
esSignatario
œœ 
=
œœ 
await
œœ $
EsSignatario
œœ% 1
(
œœ1 2
userId
œœ2 8
,
œœ8 9$
unidadAdministrativaId
œœ: P
)
œœP Q
;
œœQ R
if
—— 
(
—— 
esSignatario
—— 
)
—— 
{
““ 
throw
”” 
new
”” #
UserFriendlyException
”” /
(
””/ 0
string
””0 6
.
””6 7
Format
””7 =
(
””= >
	localizer
””> G
[
””G H
$str
””H p
]
””p q
)
””q r
)
””r s
;
””s t
}
‘‘ 
var
÷÷ 
	queryable
÷÷ 
=
÷÷ 
await
÷÷ !

repository
÷÷" ,
.
÷÷, -
WithDetailsAsync
÷÷- =
(
÷÷= >
x
÷÷> ?
=>
÷÷@ B
x
÷÷C D
.
÷÷D E
Funcionarios
÷÷E Q
)
÷÷Q R
;
÷÷R S
var
◊◊ 
query
◊◊ 
=
◊◊ 
	queryable
◊◊ !
.
◊◊! "
Where
◊◊" '
(
◊◊' (
ua
◊◊( *
=>
◊◊+ -
ua
◊◊. 0
.
◊◊0 1
Id
◊◊1 3
==
◊◊4 6$
unidadAdministrativaId
◊◊7 M
)
◊◊M N
;
◊◊N O
var
⁄⁄  
administrativeUnit
⁄⁄ "
=
⁄⁄# $
await
⁄⁄% *
AsyncExecuter
⁄⁄+ 8
.
⁄⁄8 9"
SingleOrDefaultAsync
⁄⁄9 M
(
⁄⁄M N
query
⁄⁄N S
)
⁄⁄S T
;
⁄⁄T U
if
‹‹ 
(
‹‹  
administrativeUnit
‹‹ "
.
‹‹" #
JefeMisionId
‹‹# /
!=
‹‹0 2
null
‹‹3 7
)
‹‹7 8
{
›› 
if
ﬁﬁ 
(
ﬁﬁ  
administrativeUnit
ﬁﬁ &
.
ﬁﬁ& '
JefeMisionId
ﬁﬁ' 3
==
ﬁﬁ4 6
userId
ﬁﬁ7 =
)
ﬁﬁ= >
{
ﬂﬂ 
throw
‡‡ 
new
‡‡ #
UserFriendlyException
‡‡ 3
(
‡‡3 4
string
‡‡4 :
.
‡‡: ;
Format
‡‡; A
(
‡‡A B
	localizer
‡‡B K
[
‡‡K L
$str
‡‡L t
]
‡‡t u
)
‡‡u v
)
‡‡v w
;
‡‡w x
}
·· 
}
‚‚  
administrativeUnit
‰‰ 
.
‰‰ !
EliminarFuncionario
‰‰ 2
(
‰‰2 3
userId
‰‰3 9
)
‰‰9 :
;
‰‰: ;
return
ÊÊ  
administrativeUnit
ÊÊ %
;
ÊÊ% &
}
ÁÁ 	
public
ÎÎ 
async
ÎÎ 
Task
ÎÎ 
<
ÎÎ "
UnidadAdministrativa
ÎÎ .
>
ÎÎ. /%
AssignMissionChiefAsync
ÎÎ0 G
(
ÎÎG H
Guid
ÎÎH L
id
ÎÎM O
,
ÎÎO P
Guid
ÎÎQ U
userId
ÎÎV \
)
ÎÎ\ ]
{
ÏÏ 	
Check
ÌÌ 
.
ÌÌ 
NotNull
ÌÌ 
(
ÌÌ 
id
ÌÌ 
,
ÌÌ 
nameof
ÌÌ $
(
ÌÌ$ %
id
ÌÌ% '
)
ÌÌ' (
)
ÌÌ( )
;
ÌÌ) *
Check
ÓÓ 
.
ÓÓ 
NotNull
ÓÓ 
(
ÓÓ 
userId
ÓÓ  
,
ÓÓ  !
nameof
ÓÓ" (
(
ÓÓ( )
userId
ÓÓ) /
)
ÓÓ/ 0
)
ÓÓ0 1
;
ÓÓ1 2
var
 
	queryable
 
=
 
await
 !

repository
" ,
.
, -
GetQueryableAsync
- >
(
> ?
)
? @
;
@ A
	queryable
ÚÚ 
=
ÚÚ 
	queryable
ÚÚ !
.
ÚÚ! "
Where
ÚÚ" '
(
ÚÚ' (
ua
ÚÚ( *
=>
ÚÚ+ -
ua
ÚÚ. 0
.
ÚÚ0 1
Id
ÚÚ1 3
==
ÚÚ4 6
id
ÚÚ7 9
)
ÚÚ9 :
;
ÚÚ: ;
var
ÙÙ  
administrativeUnit
ÙÙ "
=
ÙÙ# $
await
ÙÙ% *
AsyncExecuter
ÙÙ+ 8
.
ÙÙ8 9!
FirstOrDefaultAsync
ÙÙ9 L
(
ÙÙL M
	queryable
ÙÙM V
)
ÙÙV W
;
ÙÙW X
if
ˆˆ 
(
ˆˆ  
administrativeUnit
ˆˆ "
.
ˆˆ" #
JefeMisionId
ˆˆ# /
!=
ˆˆ0 2
null
ˆˆ3 7
)
ˆˆ7 8
{
˜˜ 
if
¯¯ 
(
¯¯  
administrativeUnit
¯¯ &
.
¯¯& '
JefeMisionId
¯¯' 3
==
¯¯4 6
userId
¯¯7 =
)
¯¯= >
{
˘˘ 
throw
˙˙ 
new
˙˙ #
UserFriendlyException
˙˙ 3
(
˙˙3 4
string
˙˙4 :
.
˙˙: ;
Format
˙˙; A
(
˙˙A B
	localizer
˙˙B K
[
˙˙K L
$str
˙˙L t
]
˙˙t u
)
˙˙u v
)
˙˙v w
;
˙˙w x
}
˚˚ 
}
¸¸  
administrativeUnit
˛˛ 
.
˛˛ 
AddMissionChief
˛˛ .
(
˛˛. /
userId
˛˛/ 5
)
˛˛5 6
;
˛˛6 7
return
ÄÄ  
administrativeUnit
ÄÄ %
;
ÄÄ% &
}
ÅÅ 	
public
ÖÖ 
async
ÖÖ 
Task
ÖÖ 
<
ÖÖ "
UnidadAdministrativa
ÖÖ .
>
ÖÖ. /$
AgregarSignatarioAsync
ÖÖ0 F
(
ÖÖF G
Guid
ÖÖG K"
administrativeUnitId
ÖÖL `
,
ÖÖ` a
Guid
ÖÖb f
userId
ÖÖg m
,
ÖÖm n
Guid
ÖÖo s
	serviceId
ÖÖt }
,
ÖÖ} ~
boolÖÖ É

porDefectoÖÖÑ é
=ÖÖè ê
falseÖÖë ñ
)ÖÖñ ó
{
ÜÜ 	
Check
áá 
.
áá 
NotNull
áá 
(
áá "
administrativeUnitId
áá .
,
áá. /
nameof
áá0 6
(
áá6 7"
administrativeUnitId
áá7 K
)
ááK L
)
ááL M
;
ááM N
Check
àà 
.
àà 
NotNull
àà 
(
àà 
userId
àà  
,
àà  !
nameof
àà" (
(
àà( )
userId
àà) /
)
àà/ 0
)
àà0 1
;
àà1 2
Check
ââ 
.
ââ 
NotNull
ââ 
(
ââ 
	serviceId
ââ #
,
ââ# $
nameof
ââ% +
(
ââ+ ,
	serviceId
ââ, 5
)
ââ5 6
)
ââ6 7
;
ââ7 8
var
ãã 

isAssigned
ãã 
=
ãã 
await
ãã " 
SignatarioAsignado
ãã# 5
(
ãã5 6"
administrativeUnitId
ãã6 J
,
ããJ K
userId
ããL R
,
ããR S
	serviceId
ããT ]
)
ãã] ^
;
ãã^ _
if
çç 
(
çç 

isAssigned
çç 
)
çç 
{
éé 
throw
èè 
new
èè #
UserFriendlyException
èè /
(
èè/ 0
string
èè0 6
.
èè6 7
Format
èè7 =
(
èè= >
	localizer
èè> G
[
èèG H
$str
èèH r
]
èèr s
)
èès t
)
èèt u
;
èèu v
}
êê 
var
íí 
	queryable
íí 
=
íí 
await
íí !

repository
íí" ,
.
íí, -
WithDetailsAsync
íí- =
(
íí= >
x
íí> ?
=>
íí@ B
x
ííC D
.
ííD E
Signatarios
ííE P
)
ííP Q
;
ííQ R
var
îî 
query
îî 
=
îî 
	queryable
îî !
.
îî! "
Where
îî" '
(
îî' (
au
îî( *
=>
îî+ -
au
îî. 0
.
îî0 1
Id
îî1 3
==
îî4 6"
administrativeUnitId
îî7 K
)
îîK L
;
îîL M
var
ññ  
administrativeUnit
ññ "
=
ññ# $
await
ññ% *
AsyncExecuter
ññ+ 8
.
ññ8 9"
SingleOrDefaultAsync
ññ9 M
(
ññM N
query
ññN S
)
ññS T
;
ññT U
if
òò 
(
òò  
administrativeUnit
òò "
==
òò# %
null
òò& *
)
òò* +
{
ôô 
throw
öö 
new
öö %
EntityNotFoundException
öö 1
(
öö1 2
typeof
öö2 8
(
öö8 9"
UnidadAdministrativa
öö9 M
)
ööM N
,
ööN O"
administrativeUnitId
ööP d
)
ööd e
;
ööe f
}
õõ 
if
ùù 
(
ùù 

porDefecto
ùù 
)
ùù 
{
ùù 
var
ûû 
existeOtroDefecto
ûû %
=
ûû& ' 
administrativeUnit
ûû( :
.
ûû: ;
Signatarios
ûû; F
.
ûûF G
Any
ûûG J
(
ûûJ K
x
ûûK L
=>
ûûM O
x
ûûP Q
.
ûûQ R

PorDefecto
ûûR \
)
ûû\ ]
;
ûû] ^
if
üü 
(
üü 
existeOtroDefecto
üü %
)
üü% &
{
†† 
throw
°° 
new
°° #
UserFriendlyException
°° 3
(
°°3 4
string
°°4 :
.
°°: ;
Format
°°; A
(
°°A B
	localizer
°°B K
[
°°K L
$str
°°L s
]
°°s t
)
°°t u
)
°°u v
;
°°v w
}
¢¢ 
}
££  
administrativeUnit
¶¶ 
.
¶¶ 
AgregarSignatario
¶¶ 0
(
¶¶0 1
userId
¶¶1 7
,
¶¶7 8
	serviceId
¶¶9 B
,
¶¶B C

porDefecto
¶¶D N
)
¶¶N O
;
¶¶O P
return
®®  
administrativeUnit
®® %
;
®®% &
}
©© 	
public
´´ 
virtual
´´ 
async
´´ 
Task
´´ !
<
´´! "
bool
´´" &
>
´´& ' 
SignatarioAsignado
´´( :
(
´´: ;
Guid
´´; ?"
administrativeUnitId
´´@ T
,
´´T U
Guid
´´V Z
userId
´´[ a
,
´´a b
Guid
´´c g
	serviceId
´´h q
)
´´q r
{
¨¨ 	
Check
≠≠ 
.
≠≠ 
NotNull
≠≠ 
(
≠≠ "
administrativeUnitId
≠≠ .
,
≠≠. /
nameof
≠≠0 6
(
≠≠6 7"
administrativeUnitId
≠≠7 K
)
≠≠K L
)
≠≠L M
;
≠≠M N
Check
ÆÆ 
.
ÆÆ 
NotNull
ÆÆ 
(
ÆÆ 
userId
ÆÆ  
,
ÆÆ  !
nameof
ÆÆ" (
(
ÆÆ( )
userId
ÆÆ) /
)
ÆÆ/ 0
)
ÆÆ0 1
;
ÆÆ1 2
var
∞∞ 
	queryable
∞∞ 
=
∞∞ 
await
∞∞ !1
#administrativeUnitSignerRespository
∞∞" E
.
∞∞E F
GetQueryableAsync
∞∞F W
(
∞∞W X
)
∞∞X Y
;
∞∞Y Z
	queryable
±± 
=
±± 
	queryable
±± !
.
±±! "
Where
±±" '
(
±±' (
p
±±( )
=>
±±* ,
p
±±- .
.
±±. /$
UnidadAdministrativaId
±±/ E
==
±±F H"
administrativeUnitId
±±I ]
)
±±] ^
;
±±^ _
	queryable
≤≤ 
=
≤≤ 
	queryable
≤≤ !
.
≤≤! "
Where
≤≤" '
(
≤≤' (
p
≤≤( )
=>
≤≤* ,
p
≤≤- .
.
≤≤. /
	UsuarioId
≤≤/ 8
==
≤≤9 ;
userId
≤≤< B
)
≤≤B C
;
≤≤C D
	queryable
≥≥ 
=
≥≥ 
	queryable
≥≥ !
.
≥≥! "
Where
≥≥" '
(
≥≥' (
p
≥≥( )
=>
≥≥* ,
p
≥≥- .
.
≥≥. /

ServicioId
≥≥/ 9
==
≥≥: <
	serviceId
≥≥= F
)
≥≥F G
;
≥≥G H
return
µµ 
	queryable
µµ 
.
µµ 
Any
µµ  
(
µµ  !
)
µµ! "
;
µµ" #
}
∂∂ 	
public
∏∏ 
async
∏∏ 
Task
∏∏ 
<
∏∏ "
UnidadAdministrativa
∏∏ .
>
∏∏. /%
EliminarSignatarioAsync
∏∏0 G
(
∏∏G H
Guid
∏∏H L
id
∏∏M O
,
∏∏O P
Guid
∏∏Q U
userId
∏∏V \
,
∏∏\ ]
Guid
∏∏^ b
	serviceId
∏∏c l
)
∏∏l m
{
ππ 	
Check
∫∫ 
.
∫∫ 
NotNull
∫∫ 
(
∫∫ 
id
∫∫ 
,
∫∫ 
nameof
∫∫ $
(
∫∫$ %
id
∫∫% '
)
∫∫' (
)
∫∫( )
;
∫∫) *
Check
ªª 
.
ªª 
NotNull
ªª 
(
ªª 
userId
ªª  
,
ªª  !
nameof
ªª" (
(
ªª( )
userId
ªª) /
)
ªª/ 0
)
ªª0 1
;
ªª1 2
Check
ºº 
.
ºº 
NotNull
ºº 
(
ºº 
	serviceId
ºº #
,
ºº# $
nameof
ºº% +
(
ºº+ ,
	serviceId
ºº, 5
)
ºº5 6
)
ºº6 7
;
ºº7 8
var
ææ 
queryableSigners
ææ  
=
ææ! "
await
ææ# (1
#administrativeUnitSignerRespository
ææ) L
.
ææL M
GetQueryableAsync
ææM ^
(
ææ^ _
)
ææ_ `
;
ææ` a
queryableSigners
¿¿ 
=
¿¿ 
queryableSigners
¿¿ /
.
¿¿/ 0
Where
¿¿0 5
(
¿¿5 6
s
¿¿6 7
=>
¿¿8 :
s
¿¿; <
.
¿¿< =$
UnidadAdministrativaId
¿¿= S
==
¿¿T V
id
¿¿W Y
&&
¿¿Z \
s
¿¿] ^
.
¿¿^ _

ServicioId
¿¿_ i
==
¿¿j l
	serviceId
¿¿m v
&&
¿¿w y
s
¿¿z {
.
¿¿{ |
	UsuarioId¿¿| Ö
==¿¿Ü à
userId¿¿â è
)¿¿è ê
;¿¿ê ë
var
¬¬ '
administrativeUnitService
¬¬ )
=
¬¬* +
await
¬¬, 1
AsyncExecuter
¬¬2 ?
.
¬¬? @"
SingleOrDefaultAsync
¬¬@ T
(
¬¬T U
queryableSigners
¬¬U e
)
¬¬e f
;
¬¬f g
if
ƒƒ 
(
ƒƒ '
administrativeUnitService
ƒƒ )
==
ƒƒ* ,
null
ƒƒ- 1
)
ƒƒ1 2
{
≈≈ 
throw
∆∆ 
new
∆∆ %
EntityNotFoundException
∆∆ 1
(
∆∆1 2
typeof
∆∆2 8
(
∆∆8 9-
UnidadAdministrativaFuncionario
∆∆9 X
)
∆∆X Y
,
∆∆Y Z
id
∆∆[ ]
)
∆∆] ^
;
∆∆^ _
}
«« 
var
…… 7
)usuarioPoseeConfiguracionFirmaElectronica
…… 9
=
……: ;
await
……< A,
configuracionSignatarioManager
……B `
.
……` a&
PoseenConfiguracionAsync
……a y
(
……y z
userId……z Ä
)……Ä Å
;……Å Ç
if
   
(
   7
)usuarioPoseeConfiguracionFirmaElectronica
   9
)
  9 :
{
ÀÀ 
throw
ÃÃ 
new
ÃÃ #
UserFriendlyException
ÃÃ /
(
ÃÃ/ 0
string
ÃÃ0 6
.
ÃÃ6 7
Format
ÃÃ7 =
(
ÃÃ= >
	localizer
ÃÃ> G
[
ÃÃG H
$str
ÃÃH t
]
ÃÃt u
)
ÃÃu v
)
ÃÃv w
;
ÃÃw x
}
ÕÕ 
var
–– 
	queryable
–– 
=
–– 
await
–– !

repository
––" ,
.
––, -
WithDetailsAsync
––- =
(
––= >
x
––> ?
=>
––@ B
x
––C D
.
––D E
Signatarios
––E P
)
––P Q
;
––Q R
var
—— 
query
—— 
=
—— 
	queryable
—— !
.
——! "
Where
——" '
(
——' (
ua
——( *
=>
——+ -
ua
——. 0
.
——0 1
Id
——1 3
==
——4 6
id
——7 9
)
——9 :
;
——: ;
var
””  
administrativeUnit
”” "
=
””# $
await
””% *
AsyncExecuter
””+ 8
.
””8 9"
SingleOrDefaultAsync
””9 M
(
””M N
query
””N S
)
””S T
;
””T U 
administrativeUnit
’’ 
.
’’  
EliminarSignatario
’’ 1
(
’’1 2
userId
’’2 8
,
’’8 9
	serviceId
’’: C
)
’’C D
;
’’D E
return
◊◊  
administrativeUnit
◊◊ %
;
◊◊% &
}
ÿÿ 	
public
⁄⁄ 
virtual
⁄⁄ 
async
⁄⁄ 
Task
⁄⁄ !
<
⁄⁄! "
bool
⁄⁄" &
>
⁄⁄& '
EsSignatario
⁄⁄( 4
(
⁄⁄4 5
Guid
⁄⁄5 9
userId
⁄⁄: @
,
⁄⁄@ A
Guid
⁄⁄B F
?
⁄⁄F G"
administrativeUnitId
⁄⁄H \
=
⁄⁄\ ]
null
⁄⁄] a
)
⁄⁄a b
{
€€ 	
Check
‹‹ 
.
‹‹ 
NotNull
‹‹ 
(
‹‹ 
userId
‹‹  
,
‹‹  !
nameof
‹‹" (
(
‹‹( )
userId
‹‹) /
)
‹‹/ 0
)
‹‹0 1
;
‹‹1 2
var
ﬁﬁ 
	queryable
ﬁﬁ 
=
ﬁﬁ 
await
ﬁﬁ !1
#administrativeUnitSignerRespository
ﬁﬁ" E
.
ﬁﬁE F
GetQueryableAsync
ﬁﬁF W
(
ﬁﬁW X
)
ﬁﬁX Y
;
ﬁﬁY Z
	queryable
ﬂﬂ 
=
ﬂﬂ 
	queryable
ﬂﬂ !
.
ﬂﬂ! "
Where
ﬂﬂ" '
(
ﬂﬂ' (
p
ﬂﬂ( )
=>
ﬂﬂ* ,
p
ﬂﬂ- .
.
ﬂﬂ. /
	UsuarioId
ﬂﬂ/ 8
==
ﬂﬂ9 ;
userId
ﬂﬂ< B
)
ﬂﬂB C
;
ﬂﬂC D
	queryable
·· 
=
·· 
	queryable
·· !
.
··! "
WhereIf
··" )
(
··) *"
administrativeUnitId
‚‚ '
.
‚‚' (
HasValue
‚‚( 0
,
‚‚0 1
p
„„ 
=>
„„ 
p
„„ 
.
„„ $
UnidadAdministrativaId
„„ 0
==
„„1 3"
administrativeUnitId
„„4 H
)
‰‰ 
;
‰‰ 
return
ÊÊ 
	queryable
ÊÊ 
.
ÊÊ 
Any
ÊÊ  
(
ÊÊ  !
)
ÊÊ! "
;
ÊÊ" #
}
ÁÁ 	
public
ˇˇ 
async
ˇˇ 
Task
ˇˇ 
<
ˇˇ "
UnidadAdministrativa
ˇˇ .
>
ˇˇ. /"
AgregarServicioAsync
ˇˇ0 D
(
ˇˇD E
Guid
ˇˇE I
id
ˇˇJ L
,
ˇˇL M
Guid
ˇˇN R
	serviceId
ˇˇS \
,
ˇˇ\ ]
string
ˇˇ^ d
paymentType
ˇˇe p
,
ˇˇp q
bool
ˇˇq u
isActive
ˇˇv ~
)
ˇˇ~ 
{
ÄÄ 	
Check
ÅÅ 
.
ÅÅ 
NotNull
ÅÅ 
(
ÅÅ 
id
ÅÅ 
,
ÅÅ 
nameof
ÅÅ $
(
ÅÅ$ %
id
ÅÅ% '
)
ÅÅ' (
)
ÅÅ( )
;
ÅÅ) *
Check
ÇÇ 
.
ÇÇ 
NotNull
ÇÇ 
(
ÇÇ 
	serviceId
ÇÇ #
,
ÇÇ# $
nameof
ÇÇ% +
(
ÇÇ+ ,
	serviceId
ÇÇ, 5
)
ÇÇ5 6
)
ÇÇ6 7
;
ÇÇ7 8
var
ÑÑ 
	queryable
ÑÑ 
=
ÑÑ 
await
ÑÑ !

repository
ÑÑ" ,
.
ÑÑ, -
GetQueryableAsync
ÑÑ- >
(
ÑÑ> ?
)
ÑÑ? @
;
ÑÑ@ A
var
ÖÖ 
query
ÖÖ 
=
ÖÖ 
	queryable
ÖÖ !
.
ÖÖ! "
Where
ÖÖ" '
(
ÖÖ' (
au
ÖÖ( *
=>
ÖÖ+ -
au
ÖÖ. 0
.
ÖÖ0 1
Id
ÖÖ1 3
==
ÖÖ4 6
id
ÖÖ7 9
)
ÖÖ9 :
;
ÖÖ: ;
var
áá  
administrativeUnit
áá "
=
áá# $
await
áá& +
AsyncExecuter
áá, 9
.
áá9 :"
SingleOrDefaultAsync
áá: N
(
ááN O
query
ááO T
)
ááT U
;
ááU V
if
àà 
(
àà  
administrativeUnit
àà "
==
àà# %
null
àà& *
)
àà* +
{
ââ 
throw
ää 
new
ää %
EntityNotFoundException
ää 1
(
ää1 2
typeof
ää2 8
(
ää8 9
Mre
ää9 <
.
ää< =
Sb
ää= ?
.
ää? @"
UnidadAdministrativa
ää@ T
.
ääT U
Dominio
ääU \
.
ää\ ]"
UnidadAdministrativa
ää] q
)
ääq r
,
äär s
id
äät v
)
ääv w
;
ääw x
}
ãã 
var
éé 
exist
éé 
=
éé 
await
éé !
ExisteServicioAsync
éé 1
(
éé1 2
id
éé2 4
,
éé4 5
	serviceId
éé5 >
)
éé> ?
;
éé? @
if
èè 
(
èè 
exist
èè 
)
èè 
{
êê 
throw
ëë 
new
ëë #
UserFriendlyException
ëë /
(
ëë/ 0
string
ëë0 6
.
ëë6 7
Format
ëë7 =
(
ëë= >
	localizer
ëë> G
[
ëëG H
$str
ëëH i
]
ëëi j
)
ëëj k
)
ëëk l
;
ëël m
}
íí  
administrativeUnit
îî 
.
îî 
AgregarServicio
îî .
(
îî. /
	serviceId
îî/ 8
,
îî8 9
paymentType
îî: E
,
îîE F
isActive
îîF N
)
îîN O
;
îîO P
return
ññ  
administrativeUnit
ññ %
;
ññ% &
}
óó 	
public
ôô 
async
ôô 
Task
ôô 
<
ôô "
UnidadAdministrativa
ôô .
>
ôô. /#
EliminarServicioAsync
ôô0 E
(
ôôE F
Guid
ôôF J
id
ôôK M
,
ôôM N
Guid
ôôO S
	serviceId
ôôT ]
)
ôô] ^
{
öö 	
Check
õõ 
.
õõ 
NotNull
õõ 
(
õõ 
id
õõ 
,
õõ 
nameof
õõ $
(
õõ$ %
id
õõ% '
)
õõ' (
)
õõ( )
;
õõ) *
Check
úú 
.
úú 
NotNull
úú 
(
úú 
	serviceId
úú #
,
úú# $
nameof
úú% +
(
úú+ ,
	serviceId
úú, 5
)
úú5 6
)
úú6 7
;
úú7 8
var
ûû 
queryableServices
ûû !
=
ûû" #
await
ûû$ )2
$administrativeUnitServiceRespository
ûû* N
.
ûûN O
GetQueryableAsync
ûûO `
(
ûû` a
)
ûûa b
;
ûûb c
queryableServices
†† 
=
†† 
queryableServices
††  1
.
††1 2
Where
††2 7
(
††7 8
s
††8 9
=>
††: <
s
††= >
.
††> ?$
UnidadAdministrativaId
††? U
==
††V X
id
††Y [
&&
††\ ^
s
††_ `
.
††` a

ServicioId
††a k
==
††l n
	serviceId
††o x
)
††x y
;
††y z
var
¢¢ '
administrativeUnitService
¢¢ )
=
¢¢* +
await
¢¢, 1
AsyncExecuter
¢¢2 ?
.
¢¢? @!
FirstOrDefaultAsync
¢¢@ S
(
¢¢S T
queryableServices
¢¢T e
)
¢¢e f
;
¢¢f g
if
§§ 
(
§§ '
administrativeUnitService
§§ )
==
§§* ,
null
§§- 1
)
§§1 2
{
•• 
throw
¶¶ 
new
¶¶ %
EntityNotFoundException
¶¶ 1
(
¶¶1 2
typeof
¶¶2 8
(
¶¶8 9-
UnidadAdministrativaFuncionario
¶¶9 X
)
¶¶X Y
,
¶¶Y Z
id
¶¶[ ]
)
¶¶] ^
;
¶¶^ _
}
ßß 
var
©© 
	queryable
©© 
=
©© 
await
©© !

repository
©©" ,
.
©©, -
WithDetailsAsync
©©- =
(
©©= >
x
©©> ?
=>
©©@ B
x
©©C D
.
©©D E
	Servicios
©©E N
)
©©N O
;
©©O P
var
™™ 
query
™™ 
=
™™ 
	queryable
™™ !
.
™™! "
Where
™™" '
(
™™' (
ua
™™( *
=>
™™+ -
ua
™™. 0
.
™™0 1
Id
™™1 3
==
™™4 6
id
™™7 9
)
™™9 :
;
™™: ;
var
¨¨  
administrativeUnit
¨¨ "
=
¨¨# $
await
¨¨% *
AsyncExecuter
¨¨+ 8
.
¨¨8 9"
SingleOrDefaultAsync
¨¨9 M
(
¨¨M N
query
¨¨N S
)
¨¨S T
;
¨¨T U 
administrativeUnit
ÆÆ 
.
ÆÆ 
EliminarServicio
ÆÆ /
(
ÆÆ/ 0
	serviceId
ÆÆ0 9
)
ÆÆ9 :
;
ÆÆ: ;
return
∞∞  
administrativeUnit
∞∞ %
;
∞∞% &
}
±± 	
public
≥≥ 
virtual
≥≥ 
async
≥≥ 
Task
≥≥ !
<
≥≥! "
bool
≥≥" &
>
≥≥& '!
ExisteServicioAsync
≥≥( ;
(
≥≥; <
Guid
≥≥< @"
administrativeUnitId
≥≥A U
,
≥≥U V
Guid
≥≥W [
	serviceId
≥≥\ e
)
≥≥e f
{
¥¥ 	
Check
µµ 
.
µµ 
NotNull
µµ 
(
µµ "
administrativeUnitId
µµ .
,
µµ. /
nameof
µµ0 6
(
µµ6 7"
administrativeUnitId
µµ7 K
)
µµK L
)
µµL M
;
µµM N
Check
∂∂ 
.
∂∂ 
NotNull
∂∂ 
(
∂∂ 
	serviceId
∂∂ #
,
∂∂# $
nameof
∂∂% +
(
∂∂+ ,
	serviceId
∂∂, 5
)
∂∂5 6
)
∂∂6 7
;
∂∂7 8
var
∏∏ 
	queryable
∏∏ 
=
∏∏ 
await
∏∏ !2
$administrativeUnitServiceRespository
∏∏" F
.
∏∏F G
GetQueryableAsync
∏∏G X
(
∏∏X Y
)
∏∏Y Z
;
∏∏Z [
	queryable
ππ 
=
ππ 
	queryable
ππ !
.
ππ! "
Where
ππ" '
(
ππ' (
p
ππ( )
=>
ππ* ,
p
ππ- .
.
ππ. /$
UnidadAdministrativaId
ππ/ E
==
ππF H"
administrativeUnitId
ππI ]
)
ππ] ^
;
ππ^ _
	queryable
∫∫ 
=
∫∫ 
	queryable
∫∫ !
.
∫∫! "
Where
∫∫" '
(
∫∫' (
p
∫∫( )
=>
∫∫* ,
p
∫∫- .
.
∫∫. /

ServicioId
∫∫/ 9
==
∫∫: <
	serviceId
∫∫= F
)
∫∫F G
;
∫∫G H
return
ºº 
	queryable
ºº 
.
ºº 
Any
ºº  
(
ºº  !
)
ºº! "
;
ºº" #
}
ΩΩ 	
public
√√ 
async
√√ 
Task
√√ 
<
√√ "
UnidadAdministrativa
√√ .
>
√√. /)
EstablecerJurisdiccionAsync
√√0 K
(
√√K L"
UnidadAdministrativa
√√L `"
unidadAdministrativa
√√a u
,
√√u v
IEnumerable√√w Ç
<√√Ç É
string√√É â
>√√â ä$
ciudadesJurisdiccion√√ã ü
)√√ü †
{
ƒƒ 	
Check
≈≈ 
.
≈≈ 
NotNull
≈≈ 
(
≈≈ "
unidadAdministrativa
≈≈ .
,
≈≈. /
nameof
≈≈0 6
(
≈≈6 7"
unidadAdministrativa
≈≈7 K
)
≈≈K L
)
≈≈L M
;
≈≈M N
Check
∆∆ 
.
∆∆ 
NotNull
∆∆ 
(
∆∆ "
ciudadesJurisdiccion
∆∆ .
,
∆∆. /
nameof
∆∆0 6
(
∆∆6 7"
ciudadesJurisdiccion
∆∆7 K
)
∆∆K L
)
∆∆L M
;
∆∆M N
var
»» *
ciudadesJurisdiccionActuales
»» ,
=
»»- ."
unidadAdministrativa
»»/ C
.
»»C D
Jurisdiccion
»»D P
.
»»P Q
Select
»»Q W
(
»»W X
j
»»X Y
=>
»»Z \
j
»»] ^
.
»»^ _
Ciudad
»»_ e
)
»»e f
;
»»f g
if
   
(
   "
ciudadesJurisdiccion
   $
.
  $ %
Any
  % (
(
  ( )
)
  ) *
)
  * +
{
ÀÀ "
unidadAdministrativa
ÃÃ $
.
ÃÃ$ %"
EliminarJurisdiccion
ÃÃ% 9
(
ÃÃ9 :*
ciudadesJurisdiccionActuales
ÃÃ: V
.
ÃÃV W
Except
ÃÃW ]
(
ÃÃ] ^"
ciudadesJurisdiccion
ÃÃ^ r
)
ÃÃr s
.
ÃÃs t
Distinct
ÃÃt |
(
ÃÃ| }
)
ÃÃ} ~
)
ÃÃ~ 
;ÃÃ Ä"
unidadAdministrativa
ÕÕ $
.
ÕÕ$ %!
AgregarJurisdiccion
ÕÕ% 8
(
ÕÕ8 9"
ciudadesJurisdiccion
ÕÕ9 M
.
ÕÕM N
Except
ÕÕN T
(
ÕÕT U*
ciudadesJurisdiccionActuales
ÕÕU q
)
ÕÕq r
.
ÕÕr s
Distinct
ÕÕs {
(
ÕÕ{ |
)
ÕÕ| }
)
ÕÕ} ~
;
ÕÕ~ 
}
ŒŒ 
else
œœ 
{
œœ "
unidadAdministrativa
—— $
.
——$ %"
EliminarJurisdiccion
——% 9
(
——9 :*
ciudadesJurisdiccionActuales
——: V
.
——V W
Distinct
——W _
(
——_ `
)
——` a
)
——a b
;
——b c
}
““ 
return
‘‘ 
await
‘‘ 
Task
‘‘ 
.
‘‘ 

FromResult
‘‘ (
(
‘‘( )"
unidadAdministrativa
‘‘) =
)
‘‘= >
;
‘‘> ?
}
’’ 	
}
‹‹ 
}ﬁﬁ …
{D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\UnidadAdministrativa\UnidadAdministrativaServicio.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

class (
UnidadAdministrativaServicio -
:. /
Entity0 6
{ 
	protected		 (
UnidadAdministrativaServicio		 .
(		. /
)		/ 0
{

 	
} 	
public (
UnidadAdministrativaServicio +
(+ ,
Guid  
administrativeUnitId %
,% &
Guid 
	serviceId 
, 
string 
paymentTypeId  
,  !
bool 
isActive 
) 
{ 	"
UnidadAdministrativaId "
=# $ 
administrativeUnitId% 9
;9 :

ServicioId 
= 
	serviceId "
;" #

TipoPagoId 
= 
paymentTypeId &
;& '
Activo 
= 
isActive 
; 
} 	
[ 	
Required	 
] 
public 
Guid "
UnidadAdministrativaId *
{+ ,
get- 0
;0 1
set3 6
;6 7
}8 9
[ 	
Required	 
] 
public 
Guid 

ServicioId 
{  
get! $
;$ %
set& )
;) *
}+ ,
[   	
Required  	 
]   
public!! 
string!! 

TipoPagoId!!  
{!!! "
get!!# &
;!!& '
set!!( +
;!!+ ,
}!!- .
public## 
TipoPago## 
TipoPago##  
{##! "
get### &
;##& '
set##( +
;##+ ,
}##- .
[%% 	
Required%%	 
]%% 
public&& 
bool&& 
Activo&& 
{&& 
get&&  
;&&  !
set&&" %
;&&% &
}&&' (
public(( 
override(( 
object(( 
[(( 
]((  
GetKeys((! (
(((( )
)(() *
{)) 	
return** 
new** 
object** 
[** 
]** 
{**  !"
UnidadAdministrativaId**" 8
,**8 9

ServicioId**: D
}**E F
;**F G
}++ 	
}-- 
}// —
aD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Ventanilla\TipoAtencion.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

class 
TipoAtencion 
: 
Entity  &
<& '
string' -
>- .
{ 
[ 	
Required	 
] 
[		 	
StringLength			 
(		 
DomainCommonConsts		 (
.		( )
MaxIdLength		) 4
)		4 5
]		5 6
[

 	
RegularExpression

	 
(

 
DomainCommonConsts

 -
.

- .
ExpressionRegular

. ?
.

? @
Alfanumericos

@ M
)

M N
]

N O
public 
override 
string 
Id !
{" #
get$ '
;' (
	protected) 2
set3 6
;6 7
}8 9
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxNameLength) 6
)6 7
]7 8
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @,
 AlfanumericosGuionesPuntoEspacio@ `
)` a
]a b
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
	protected 
TipoAtencion 
( 
)  
{ 	
} 	
public 
TipoAtencion 
( 
string "
id# %
)% &
:	 

base 
( 
id 
) 
{ 	
} 	
} 
} ê
_D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Ventanilla\Ventanilla.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

class 

Ventanilla 
:  
AuditedAggregateRoot 2
<2 3
Guid3 7
>7 8
{ 
	protected 

Ventanilla 
( 
) 
{ 	
} 	
public 

Ventanilla 
( 
Guid 
id !
,! "
Guid# '"
admiministrativeUnitId( >
,> ?
string@ F
nameG K
,K L
boolM Q!
isPresentialAttentionR g
,g h
booli m
isVirtualAttention	n Ä
,
Ä Å
string
Ç à
attentionStart
â ó
,
ó ò
string
ô ü
attentionEnd
† ¨
,
¨ ≠
bool
Æ ≤
isActive
≥ ª
)
ª º
{ 	
Id 
= 
id 
; "
UnidadAdministrativaId "
=# $"
admiministrativeUnitId% ;
;; <
Nombre 
= 
name 
; 
AtencionPresencial 
=  !
isPresentialAttention! 6
;6 7
AtencionVirtual 
= 
isVirtualAttention 0
;0 1
InicioAtencion 
= 
attentionStart +
;+ ,
FinAtencion 
= 
attentionEnd &
;& '
Activo 
= 
isActive 
; 
} 	
[ 	
Required	 
] 
public   
Guid   "
UnidadAdministrativaId   *
{  + ,
get  - 0
;  0 1
set  2 5
;  5 6
}  7 8
["" 	
Required""	 
]"" 
[## 	
StringLength##	 
(## 
DomainCommonConsts## (
.##( )
MaxNameLength##) 6
)##6 7
]##7 8
[$$ 	
RegularExpression$$	 
($$ 
DomainCommonConsts$$ -
.$$- .
ExpressionRegular$$. ?
.$$? @,
 AlfanumericosGuionesPuntoEspacio$$@ `
)$$` a
]$$a b
public%% 
string%% 
Nombre%% 
{%% 
get%% "
;%%" #
set%%$ '
;%%' (
}%%) *
public'' 
bool'' 
AtencionPresencial'' &
{''' (
get'') ,
;'', -
set''. 1
;''1 2
}''3 4
public)) 
bool)) 
AtencionVirtual)) #
{))$ %
get))& )
;))) *
set))+ .
;)). /
}))0 1
public++ 
string++ 
InicioAtencion++ $
{++% &
get++' *
;++* +
set++, /
;++/ 0
}++1 2
public-- 
string-- 
FinAtencion-- !
{--" #
get--$ '
;--' (
set--) ,
;--, -
}--. /
public// 
bool// 
Activo// 
{// 
get//  
;//  !
set//" %
;//% &
}//' (
public11 
void11 

ChangeName11 
(11 
string11 %
newName11& -
)11- .
{22 	
this33 
.33 
Nombre33 
=33 
newName33 !
;33! "
}44 	
public66 
void66 
ChangeIsActive66 "
(66" #
bool66# '
newIsActive66( 3
)663 4
{77 	
this88 
.88 
Activo88 
=88 
newIsActive88 %
;88% &
}99 	
};; 
}<< Œ0
fD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\Ventanilla\VentanillaManager.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

class 
VentanillaManager "
:# $
DomainService% 2
{ 
private 
readonly 
IRepository $
<$ %

Ventanilla% /
,/ 0
Guid1 5
>5 6$
agentAttentionRepository7 O
;O P
private 
readonly 
IStringLocalizer )
<) *&
AdministrativeUnitResource* D
>D E
	localizerF O
;O P
public 
VentanillaManager  
(  !
IRepository! ,
<, -

Ventanilla- 7
,7 8
Guid9 =
>= >$
agentAttentionRepository? W
,W X
IStringLocalizerY i
<i j'
AdministrativeUnitResource	j Ñ
>
Ñ Ö
	localizer
Ü è
)
è ê
{ 	
this 
. $
agentAttentionRepository )
=* +$
agentAttentionRepository, D
;D E
this 
. 
	localizer 
= 
	localizer &
;& '
} 	
public 
virtual 
async 
Task !
<! "

Ventanilla" ,
>, -
CreateAsync. 9
(9 :
Guid: >
id? A
,A B
GuidC G"
admiministrativeUnitIdH ^
,^ _
string` f
nameg k
,k l
bool !
isPresentialAttention )
,) *
bool+ /
isVirtualAttention0 B
,B C
stringD J
attentionStartK Y
,Y Z
string[ a
attentionEndb n
,n o
boolp t
isActiveu }
=~ 
true
Ä Ñ
)
Ñ Ö
{ 	
var 
	queryable 
= 
await !$
agentAttentionRepository" :
.: ;
GetQueryableAsync; L
(L M
)M N
;N O
var 
existing 
= 
	queryable $
.$ %
Any% (
(( )
e) *
=>+ -
e. /
./ 0
Nombre0 6
.6 7
ToUpper7 >
(> ?
)? @
==A C
nameD H
.H I
ToUpperI P
(P Q
)Q R
)R S
;S T
if!! 
(!! 
existing!! 
)!! 
{"" 
var## 
msg## 
=## 
string##  
.##  !
Format##! '
(##' (
	localizer##( 1
[##1 2
$str##2 L
]##L M
,##M N
name##O S
)##S T
;##T U
throw$$ 
new$$ !
UserFriendlyException$$ /
($$/ 0
msg$$0 3
)$$3 4
;$$4 5
}%% 
var'' 
entity'' 
='' 
new'' 

Ventanilla'' '
(''' (
id''( *
:''* +
id'', .
,''. /"
admiministrativeUnitId''0 F
:''F G"
admiministrativeUnitId''H ^
,''^ _
name''a e
:''e f
name''g k
,''k l"
isPresentialAttention	''m Ç
:
''Ç É#
isPresentialAttention
''Ñ ô
,
''ô ö 
isVirtualAttention
''õ ≠
:
''≠ Æ 
isVirtualAttention
''Ø ¡
,
''¡ ¬
attentionStart
''√ —
:
''— “
attentionStart
''” ·
,
''· ‚
attentionEnd
''„ Ô
:
''Ô 
attentionEnd
''Ò ˝
,
''˝ ˛
isActive
''ˇ á
:
''á à
isActive
''â ë
)
''ë í
;
''í ì
return)) 
entity)) 
;)) 
}** 	
public,, 
async,, 
Task,, 
ChangeNameAsync,, )
(,,) *

Ventanilla-- 
agentAttention-- (
,--( )
string.. 
newName.. 
).. 
{// 	
Check00 
.00 
NotNull00 
(00 
agentAttention00 (
,00( )
nameof00* 0
(000 1
agentAttention001 ?
)00? @
)00@ A
;00A B
Check11 
.11 
NotNullOrWhiteSpace11 %
(11% &
newName11& -
,11- .
nameof11/ 5
(115 6
newName116 =
)11= >
)11> ?
;11? @
var33 
	queryable33 
=33 
await33 !$
agentAttentionRepository33" :
.33: ;
GetQueryableAsync33; L
(33L M
)33M N
;33N O
var44 
existing44 
=44 
	queryable44 $
.44$ %
Any44% (
(44( )
e44) *
=>44+ -
e44. /
.44/ 0
Nombre440 6
.446 7
ToUpper447 >
(44> ?
)44? @
==44A C
newName44D K
.44K L
ToUpper44L S
(44S T
)44T U
&&44V X
e55 
.55 
Id55 
==55 
agentAttention55 *
.55* +
Id55+ -
)55- .
;55. /
if77 
(77 
existing77 
)77 
{88 
var99 
msg99 
=99 
string99  
.99  !
Format99! '
(99' (
	localizer99( 1
[991 2
$str992 L
]99L M
,99M N
newName99O V
)99V W
;99W X
throw:: 
new:: !
UserFriendlyException:: /
(::/ 0
msg::0 3
)::3 4
;::4 5
};; 
agentAttention== 
.== 

ChangeName== %
(==% &
newName==& -
)==- .
;==. /
}>> 	
}?? 
}@@ 