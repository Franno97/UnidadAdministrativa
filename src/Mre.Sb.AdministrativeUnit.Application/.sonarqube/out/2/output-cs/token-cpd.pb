�
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
} �
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
} �%
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
}NN �h
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
string	UU~ �
descripcion
UU� �
,
UU� �
int
UU� �
orden
UU� �
,
UU� �
int
UU� �
numeroJerarquia
UU� �
)
UU� �
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
descripcion	[[{ �
,
[[� �
orden
[[� �
:
[[� �
orden
[[� �
,
[[� �
numeroJerarquia
[[� �
:
[[� �
numeroJerarquia
[[� �
)
[[� �
;
[[� �
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
	ArancelId	kk| �
)
kk� �
;
kk� �
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
Descripcion	vvw �
,
vv� �"
jerarquiaArancelaria
vv� �
.
vv� �
Orden
vv� �
,
vv� �"
jerarquiaArancelaria
vv� �
.
vv� �
NumeroJerarquia
vv� �
)
vv� �
;
vv� �
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
�� !
queryableJerarquias
�� #
=
��$ %
await
��& +,
jerarquiaArancelariaRepository
��, J
.
��J K
GetQueryableAsync
��K \
(
��\ ]
)
��] ^
;
��^ _!
queryableJerarquias
�� 
=
��  !!
queryableJerarquias
��" 5
.
��5 6
Where
��6 ;
(
��; <
s
��< =
=>
��> @
s
��A B
.
��B C
	ArancelId
��C L
==
��M O
	arancelId
��P Y
&&
��Z \
s
��] ^
.
��^ _
Id
��_ a
==
��b d
jerarquiaId
��e p
)
��p q
;
��q r
var
�� 
	jerarquia
�� 
=
�� 
await
�� !
AsyncExecuter
��" /
.
��/ 0!
FirstOrDefaultAsync
��0 C
(
��C D!
queryableJerarquias
��D W
)
��W X
;
��X Y
if
�� 
(
�� 
	jerarquia
�� 
==
�� 
null
�� !
)
��! "
{
�� 
throw
�� 
new
�� %
EntityNotFoundException
�� 1
(
��1 2
typeof
��2 8
(
��8 9"
JerarquiaArancelaria
��9 M
)
��M N
,
��N O
jerarquiaId
��P [
)
��[ \
;
��\ ]
}
�� 
var
�� 
	queryable
�� 
=
�� 
await
�� !

repository
��" ,
.
��, -
GetQueryableAsync
��- >
(
��> ?
)
��? @
;
��@ A
var
�� 
query
�� 
=
�� 
	queryable
�� !
.
��! "
Where
��" '
(
��' (
a
��( )
=>
��* ,
a
��- .
.
��. /
Id
��/ 1
==
��2 4
	arancelId
��5 >
)
��> ?
;
��? @
var
�� 
arancel
�� 
=
�� 
await
�� 
AsyncExecuter
��  -
.
��- .!
FirstOrDefaultAsync
��. A
(
��A B
query
��B G
)
��G H
;
��H I
arancel
�� 
.
�� 
QuitarJerarquia
�� #
(
��# $
jerarquiaId
��$ /
)
��/ 0
;
��0 1
return
�� 
arancel
�� 
;
�� 
}
�� 	
}
�� 
}�� �)
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
numeroJerarquia	..v �
)
..� �
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
}WW �b
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
description	""x �
,
""� �
int
""� �
order
""� �
,
""� �
int
""� �
hierarchyNumber
""� �
)
""� �
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
description	..y �
,
..� �
orden
..� �
:
..� �
order
..� �
,
..� �
numeroJerarquia
..� �
:
..� �
hierarchyNumber
..� �
)
..� �
;
..� �
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
descripcion	IIx �
,
II� �
string
II� �
numeroPartida
II� �
,
II� �
decimal
II� �
valor
II� �
)
II� �
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
descripcion	OOu �
,
OO� �
numeroPartida
OO� �
:
OO� �
numeroPartida
OO� �
,
OO� �
valor
OO� �
:
OO� �
valor
OO� �
)
OO� �
;
OO� �
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
partidaArancelaria	__t �
.
__� �$
JerarquiaArancelariaId
__� �
)
__� �
;
__� �
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
partidaArancelaria	bb~ �
.
bb� �
Valor
bb� �
)
bb� �
;
bb� �
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
partidaArancelariaId	hhp �
)
hh� �
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
partidaArancelariaId	oo{ �
)
oo� �
;
oo� �
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
�� 	
}
�� 
}�� �"
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
)	%% �
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
}BB �d
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
value	##} �
,
##� �
Guid
##� �
tariffHierarchyId
##� �
)
##� �
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
numeroPartida	..} �
:
..� �
headingNumber
..� �
,
..� �
valor
..� �
:
..� �
value
..� �
)
..� �
;
..� �
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
tariffHeadingId	ppq �
)
pp� �
;
pp� �)
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
�� 
tariffHeading
��  
;
��  !
}
�� 	
}
�� 
}�� �
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
}&& �
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
}   �
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
}** �%
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
}NN �i
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
expirationDate	""v �
)
""� �
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
expirationDate	..t �
)
..� �
;
..� �
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
�� 
	queryable
�� 
=
�� 
await
�� !

repository
��" ,
.
��, -
GetQueryableAsync
��- >
(
��> ?
)
��? @
;
��@ A
var
�� 
query
�� 
=
�� 
	queryable
�� !
.
��! "
Where
��" '
(
��' (
ua
��( *
=>
��+ -
ua
��. 0
.
��0 1
Id
��1 3
==
��4 6
id
��7 9
)
��9 :
;
��: ;
var
�� 
	agreement
�� 
=
�� 
await
�� !
AsyncExecuter
��" /
.
��/ 0!
FirstOrDefaultAsync
��0 C
(
��C D
query
��D I
)
��I J
;
��J K
	agreement
�� 
.
�� 
RemoveExoneration
�� '
(
��' (
	serviceId
��( 1
)
��1 2
;
��2 3
return
�� 
	agreement
�� 
;
�� 
}
�� 	
public
�� 
virtual
�� 
async
�� 
Task
�� !
<
��! "
bool
��" &
>
��& '#
ExistExonerationAsync
��( =
(
��= >
Guid
��> B
agreementId
��C N
,
��N O
Guid
��P T
	serviceId
��U ^
)
��^ _
{
�� 	
Check
�� 
.
�� 
NotNull
�� 
(
�� 
agreementId
�� %
,
��% &
nameof
��' -
(
��- .
agreementId
��. 9
)
��9 :
)
��: ;
;
��; <
Check
�� 
.
�� 
NotNull
�� 
(
�� 
	serviceId
�� #
,
��# $
nameof
��% +
(
��+ ,
	serviceId
��, 5
)
��5 6
)
��6 7
;
��7 8
var
�� 
	queryable
�� 
=
�� 
await
�� !#
exonerationRepository
��" 7
.
��7 8
GetQueryableAsync
��8 I
(
��I J
)
��J K
;
��K L
	queryable
�� 
=
�� 
	queryable
�� !
.
��! "
Where
��" '
(
��' (
p
��( )
=>
��* ,
p
��- .
.
��. /

ConvenioId
��/ 9
==
��: <
agreementId
��= H
)
��H I
;
��I J
	queryable
�� 
=
�� 
	queryable
�� !
.
��! "
Where
��" '
(
��' (
p
��( )
=>
��* ,
p
��- .
.
��. /

ServicioId
��/ 9
==
��: <
	serviceId
��= F
)
��F G
;
��G H
return
�� 
	queryable
�� 
.
�� 
Any
��  
(
��  !
)
��! "
;
��" #
}
�� 	
}
�� 
}�� �
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
}   �
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
}** �"
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
}HH �
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
}   �
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
}** �
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
}   �
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
}(( �
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
} �
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
}&& �
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
currentVolume	~ �
,
� �
int
� �
nextPage
� �
,
� �
int
� �
year
� �
)
� �
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
}44 � 
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
AdministrativeUnitResource	t �
>
� �
	localizer
� �
)
� �
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
bookId	z �
,
� �
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
e	   �
.
  � �
LibroId
  � �
==
  � �
bookId
  � �
)
  � �
;
  � �
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
bookId	(( �
,
((� � 
numberPageByVolume
((� �
:
((� � 
numberPageByVolume
((� �
,
((� �
currentVolume
((� �
:
((� �
currentVolume
((� �
,
((� �
nextPage
((� �
:
((� �
nextPage
((� �
,
((� �
year
((� �
:
((� �
year
((� �
)
((� �
;
((� �
return** 
entity** 
;** 
}++ 	
},, 
}-- �
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
� � 
isVirtualAttention
� �
,
� �
bool
� �
isActive
� �
=
� �
true
� �
)
� �
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
}<< �
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
}$$ �2
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
� �
=
� �
true
� �
)
� �
{
� �
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
isVirtualAttention	$$t �
:
$$� � 
isVirtualAttention
$$� �
,
$$� �
isActive
$$� �
:
$$� �
isActive
$$� �
)
$$� �
;
$$� �
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
}JJ �
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
}## �
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
}'' �
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
}   �
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
}++ �
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
} �
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
} �
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
}!! �
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
}'' �
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
byte	~ �
[
� �
]
� �
data
� �
,
� �
string
� �
clave
� �
)
� �
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
}KK �
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
}++ �
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
}"" �
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
}'' �
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
},, �
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
}## �
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
}'' �
�D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain\UnidadAdministrativa\Repository\IUnidadAdministrativaRepository.cs�
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
}.. �
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
}!! �
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
}** �
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
}%% �
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
}++ ��
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
string	} �
acronym
� �
,
� �
string
� �
	countryId
� �
,
� �
string
� �
regionId
� �
,
� �
string
� �
city
� �
,
� �
string
� �
address
� �
,
� �
string
� �
zipCode
� �
,
� �
string
� �
bankId
� �
,
� �
string
� �

currencyId
� �
,
� �
DateTime
� �
?
� � 
operationStartDate
� �
,
� �
DateTime
� �
?
� �
operationEndDate
� �
,
� �
string
� �
levelId
� �
,
� �
bool
� �
isActive
� �
,
� �
string
� �
observations
� �
,
� �
string
� �"
tipoCuentaBancariaId
� �
,
� �
string
� �#
titularCuentaBancaria
� �
,
� �
string
� �"
numeroCuentaBancaria
� �
,
� �
string
� �
codigo
� �
)
� �
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
�� 
DateTime
�� 
?
�� 
FechaFinOperacion
�� *
{
��+ ,
get
��- 0
;
��0 1
set
��3 6
;
��6 7
}
��8 9
public
�� 
bool
�� 
Activo
�� 
{
�� 
get
��  
;
��  !
set
��" %
;
��% &
}
��' (
public
�� 
string
�� 
NivelId
�� 
{
�� 
get
��  #
;
��# $
set
��% (
;
��( )
}
��* +
public
�� 
Nivel
�� 
Nivel
�� 
{
�� 
get
��  
;
��  !
set
��" %
;
��% &
}
��' (
public
�� 
string
�� 
Observaciones
�� #
{
��$ %
get
��& )
;
��) *
set
��+ .
;
��. /
}
��0 1
public
�� 
Guid
�� 
?
�� 
JefeMisionId
�� !
{
��" #
get
��$ '
;
��' (
set
��) ,
;
��, -
}
��. /
public
�� 
virtual
�� 
ICollection
�� "
<
��" #-
UnidadAdministrativaFuncionario
��# B
>
��B C
Funcionarios
��D P
{
��Q R
get
��S V
;
��V W
	protected
��X a
set
��b e
;
��e f
}
��g h
=
��i j
new
��k n
List
��o s
<
��s t.
UnidadAdministrativaFuncionario��t �
>��� �
(��� �
)��� �
;��� �
public
�� 
virtual
�� 
ICollection
�� "
<
��" #*
UnidadAdministrativaServicio
��# ?
>
��? @
	Servicios
��A J
{
��K L
get
��M P
;
��P Q
	protected
��R [
set
��\ _
;
��_ `
}
��a b
=
��c d
new
��e h
List
��i m
<
��m n+
UnidadAdministrativaServicio��n �
>��� �
(��� �
)��� �
;��� �
public
�� 
virtual
�� 
ICollection
�� "
<
��" #
Jurisdiccion
��# /
>
��/ 0
Jurisdiccion
��1 =
{
��> ?
get
��@ C
;
��C D
	protected
��E N
set
��O R
;
��R S
}
��T U
=
��V W
new
��X [
List
��\ `
<
��` a
Jurisdiccion
��a m
>
��m n
(
��n o
)
��o p
;
��p q
public
�� 
virtual
�� 
ICollection
�� "
<
��" #

Signatario
��# -
>
��- .
Signatarios
��/ :
{
��; <
get
��= @
;
��@ A
	protected
��B K
set
��L O
;
��O P
}
��Q R
=
��S T
new
��U X
List
��Y ]
<
��] ^

Signatario
��^ h
>
��h i
(
��i j
)
��j k
;
��k l
public
�� 
void
��  
AgregarFuncionario
�� &
(
��& '
Guid
��' +
	usuarioId
��, 5
,
��5 6
string
��7 =
cargoId
��> E
)
��E F
{
�� 	
Check
�� 
.
�� 
NotNull
�� 
(
�� 
	usuarioId
�� #
,
��# $
nameof
��% +
(
��+ ,
	usuarioId
��, 5
)
��5 6
)
��6 7
;
��7 8
Check
�� 
.
�� 
NotNull
�� 
(
�� 
cargoId
�� !
,
��! "
nameof
��# )
(
��) *
cargoId
��* 1
)
��1 2
)
��2 3
;
��3 4
Funcionarios
�� 
.
�� 
Add
�� 
(
�� 
new
��  -
UnidadAdministrativaFuncionario
��! @
(
��@ A
this
��A E
.
��E F
Id
��F H
,
��H I
	usuarioId
��J S
,
��S T
cargoId
��U \
)
��\ ]
)
��] ^
;
��^ _
}
�� 	
public
�� 
void
�� !
EliminarFuncionario
�� '
(
��' (
Guid
��( ,
	usuarioId
��- 6
)
��6 7
{
�� 	
Funcionarios
�� 
.
�� 
	RemoveAll
�� "
(
��" #
f
��# $
=>
��% '
f
��( )
.
��) *
	UsuarioId
��* 3
==
��4 6
	usuarioId
��7 @
)
��@ A
;
��A B
}
�� 	
public
�� 
void
�� 
AgregarServicio
�� #
(
��# $
Guid
��$ (
	serviceId
��) 2
,
��2 3
string
��4 :
paymentTypeId
��; H
,
��H I
bool
��J N
isActive
��O W
)
��W X
{
�� 	
Check
�� 
.
�� 
NotNull
�� 
(
�� 
	serviceId
�� #
,
��# $
nameof
��% +
(
��+ ,
	serviceId
��, 5
)
��5 6
)
��6 7
;
��7 8
Check
�� 
.
�� 
NotNull
�� 
(
�� 
paymentTypeId
�� '
,
��' (
nameof
��) /
(
��/ 0
paymentTypeId
��0 =
)
��= >
)
��> ?
;
��? @
	Servicios
�� 
.
�� 
Add
�� 
(
�� 
new
�� *
UnidadAdministrativaServicio
�� :
(
��: ;
this
��; ?
.
��? @
Id
��@ B
,
��B C
	serviceId
��D M
,
��M N
paymentTypeId
��O \
,
��\ ]
isActive
��^ f
)
��f g
)
��g h
;
��h i
}
�� 	
public
�� 
void
�� 
EliminarServicio
�� $
(
��$ %
Guid
��% )
	serviceId
��* 3
)
��3 4
{
�� 	
	Servicios
�� 
.
�� 
	RemoveAll
��  
(
��  !
s
��! "
=>
��# %
s
��& '
.
��' (

ServicioId
��( 2
==
��3 5
	serviceId
��6 ?
)
��? @
;
��@ A
}
�� 	
public
�� 
void
�� 
CambiarNombre
�� !
(
��! "
string
��" (
newName
��) 0
)
��0 1
{
�� 	
this
�� 
.
�� 
Nombre
�� 
=
�� 
newName
�� !
;
��! "
}
�� 	
public
�� 
void
�� 
ChangeState
�� 
(
��  
bool
��  $
isActive
��% -
)
��- .
{
�� 	
this
�� 
.
�� 
Activo
�� 
=
�� 
isActive
�� "
;
��" #
}
�� 	
public
�� 
void
�� 
CambiarSigla
��  
(
��  !
string
��! '
sigla
��( -
)
��- .
{
�� 	
this
�� 
.
�� 
Siglas
�� 
=
�� 
sigla
�� 
;
��  
}
�� 	
public
�� 
void
�� 
CambiarCodigo
�� !
(
��! "
string
��" (
codigo
��) /
)
��/ 0
{
�� 	
this
�� 
.
�� 
Codigo
�� 
=
�� 
codigo
��  
;
��  !
}
�� 	
public
�� 
void
�� 
AddMissionChief
�� #
(
��# $
Guid
��$ (
jefeMisionId
��) 5
)
��5 6
{
�� 	
JefeMisionId
�� 
=
�� 
jefeMisionId
�� '
;
��' (
}
�� 	
public
�� 
void
�� 
AgregarSignatario
�� %
(
��% &
Guid
��& *
userId
��+ 1
,
��1 2
Guid
��3 7
	serviceId
��8 A
,
��A B
bool
��C G

porDefecto
��H R
=
��S T
false
��U Z
)
��Z [
{
�� 	
Check
�� 
.
�� 
NotNull
�� 
(
�� 
	serviceId
�� #
,
��# $
nameof
��% +
(
��+ ,
	serviceId
��, 5
)
��5 6
)
��6 7
;
��7 8
Check
�� 
.
�� 
NotNull
�� 
(
�� 
userId
��  
,
��  !
nameof
��" (
(
��( )
userId
��) /
)
��/ 0
)
��0 1
;
��1 2
Signatarios
�� 
.
�� 
Add
�� 
(
�� 
new
�� 

Signatario
��  *
(
��* +
this
��+ /
.
��/ 0
Id
��0 2
,
��2 3
userId
��4 :
,
��: ;
	serviceId
��< E
,
��E F

porDefecto
��G Q
)
��Q R
)
��R S
;
��S T
}
�� 	
public
�� 
void
��  
EliminarSignatario
�� &
(
��& '
Guid
��' +
userId
��, 2
,
��2 3
Guid
��4 8
	serviceId
��9 B
)
��B C
{
�� 	
Signatarios
�� 
.
�� 
	RemoveAll
�� !
(
��! "
s
��" #
=>
��$ &
s
��' (
.
��( )
	UsuarioId
��) 2
==
��3 5
userId
��6 <
&&
��= ?
s
��@ A
.
��A B

ServicioId
��B L
==
��M O
	serviceId
��P Y
)
��Y Z
;
��Z [
}
�� 	
public
�� 
void
�� !
AgregarJurisdiccion
�� '
(
��' (
IEnumerable
��( 3
<
��3 4
string
��4 :
>
��: ;"
ciudadesJurisdiccion
��< P
)
��P Q
{
�� 	
Check
�� 
.
�� 
NotNull
�� 
(
�� "
ciudadesJurisdiccion
�� .
,
��. /
nameof
��0 6
(
��6 7"
ciudadesJurisdiccion
��7 K
)
��K L
)
��L M
;
��M N
foreach
�� 
(
�� 
var
�� 
ciudad
�� 
in
��  ""
ciudadesJurisdiccion
��# 7
)
��7 8
{
�� 
Jurisdiccion
�� 
.
�� 
Add
��  
(
��  !
new
��! $
Jurisdiccion
��% 1
(
��1 2
this
��2 6
.
��6 7
Id
��7 9
,
��9 :
ciudad
��; A
)
��A B
)
��B C
;
��C D
}
�� 
}
�� 	
public
�� 
void
�� "
EliminarJurisdiccion
�� (
(
��( )
IEnumerable
��) 4
<
��4 5
string
��5 ;
>
��; <"
ciudadesJurisdiccion
��= Q
)
��Q R
{
�� 	
Check
�� 
.
�� 
NotNull
�� 
(
�� "
ciudadesJurisdiccion
�� /
,
��/ 0
nameof
��1 7
(
��7 8"
ciudadesJurisdiccion
��8 L
)
��L M
)
��M N
;
��N O
var
�� "
jurisdiccionEliminar
�� $
=
��% &
new
��' *
List
��+ /
<
��/ 0
Jurisdiccion
��0 <
>
��< =
(
��= >
)
��> ?
;
��? @
foreach
�� 
(
�� 
var
�� 
ciudad
�� 
in
��  ""
ciudadesJurisdiccion
��# 7
)
��7 8
{
�� 
var
�� 
jurisdiccion
��  
=
��! "
Jurisdiccion
��# /
.
��/ 0
SingleOrDefault
��0 ?
(
��? @
j
��@ A
=>
��B D
j
��E F
.
��F G
Ciudad
��G M
==
��N P
ciudad
��Q W
.
��W X
ToUpper
��X _
(
��_ `
)
��` a
)
��a b
;
��b c
if
�� 
(
�� 
jurisdiccion
��  
==
��! #
null
��$ (
)
��( )
{
��* +
throw
�� 
new
�� #
UserFriendlyException
�� 3
(
��3 4
string
��4 :
.
��: ;
Format
��; A
(
��A B
$str
��B {
,
��{ |
Ciudad��} �
)��� �
)��� �
;��� �
}
�� "
jurisdiccionEliminar
�� $
.
��$ %
Add
��% (
(
��( )
jurisdiccion
��) 5
)
��5 6
;
��6 7
}
�� 
if
�� 
(
�� "
jurisdiccionEliminar
�� $
.
��$ %
Any
��% (
(
��( )
)
��) *
)
��* +
{
��, -
Jurisdiccion
�� 
.
�� 
	RemoveAll
�� &
(
��& '"
jurisdiccionEliminar
��' ;
)
��; <
;
��< =
}
�� 
}
�� 	
}
�� 
}�� �
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
}'' ��
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
administrativeUnitTypeId	**o �
,
**� �
Guid
**� �
?
**� �(
administrativeDependencyId
**� �
,
**� �
string
**� �
acronym
**� �
,
**� �
string
**� �
	countryId
**� �
,
**� �
string
**� �
regionId
**� �
,
**� �
string
**� �
city
**� �
,
**� �
string
**� �
address
**� �
,
**� �
string
**� �
zipCode
**� �
,
**� �
string
**� �
bankId
**� �
,
**� �
string
**� �

currencyId
**� �
,
**� �
DateTime
**� �
?
**� � 
operationStartDate
**� �
,
**� �
DateTime
**� �
?
**� �
operationEndDate
**� �
,
**� �
string
**� �
levelId
**� �
,
**� �
string
**� �"
tipoCuentaBancariaId
**� �
,
**� �
string
**� �#
titularCuentaBancaria
**� �
,
**� �
string
**� �"
numeroCuentaBancaria
**� �
,
**� �
bool
**� �
isActive
**� �
=
**� �
true
**� �
,
**� �
string
**� �
observations
**� �
=
**� �
null
**� �
)
**� �
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
administrativeUnitTypeId	AAp �
,
AA� �(
administrativeDependencyId
AA� �
:
AA� �(
administrativeDependencyId
AA� �
,
AA� �
acronym
AA� �
:
AA� �
acronym
AA� �
,
AA� �
	countryId
AA� �
:
AA� �
	countryId
AA� �
,
AA� �
regionId
AA� �
:
AA� �
regionId
AA� �
,
AA� �
city
AA� �
:
AA� �
city
AA� �
,
AA� �
address
AA� �
:
AA� �
address
AA� �
,
AA� �
zipCode
AA� �
:
AA� �
zipCode
AA� �
,
AA� �
bankId
AA� �
:
AA� �
bankId
AA� �
,
AA� �

currencyId
AA� �
:
AA� �

currencyId
AA� �
,
AA� � 
operationStartDate
AA� �
:
AA� � 
operationStartDate
AA� �
,
AA� �
operationEndDate
AA� �
:
AA� �
operationEndDate
AA� �
,
AA� �
levelId
AA� �
:
AA� �
levelId
AA� �
,
AA� �
isActive
AA� �
:
AA� �
isActive
AA� �
,
AA� �
observations
AA� �
:
AA� �
observations
AA� �
,
AA� �"
tipoCuentaBancariaId
AA� �
:
AA� �"
tipoCuentaBancariaId
AA� �
,
AA� �#
titularCuentaBancaria
AA� �
:
AA� �#
titularCuentaBancaria
AA� �
,
AA� �"
numeroCuentaBancaria
AA� �
:
AA� �"
numeroCuentaBancaria
AA� �
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
�� 
.
�� 
CambiarCodigo
�� ,
(
��, -
nuevoCodigo
��- 8
)
��8 9
;
��9 :
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� "
UnidadAdministrativa
�� .
>
��. / 
CambiarEstadoAsync
��0 B
(
��B C
Guid
��C G
id
��H J
,
��J K
bool
��L P
isActive
��Q Y
)
��Y Z
{
�� 	
Check
�� 
.
�� 
NotNull
�� 
(
�� 
id
�� 
,
�� 
nameof
�� $
(
��$ %
id
��% '
)
��' (
)
��( )
;
��) *
var
��  
administrativeUnit
�� "
=
��# $
await
��% *

repository
��+ 5
.
��5 6
GetAsync
��6 >
(
��> ?
id
��? A
)
��A B
;
��B C
var
�� 
existing
�� 
=
�� 
false
��  
;
��  !
if
�� 
(
�� 
existing
�� 
)
�� 
{
�� 
throw
�� 
new
�� 
AbpException
�� &
(
��& '
string
��' -
.
��- .
Format
��. 4
(
��4 5
	localizer
��5 >
[
��> ?
$str
��? i
]
��i j
,
��j k 
administrativeUnit
��l ~
.
��~ 
Nombre�� �
)��� �
)��� �
;��� �
}
�� 
if
�� 
(
��  
administrativeUnit
�� "
.
��" #
Activo
��# )
==
��* ,
isActive
��- 5
)
��5 6
{
�� 
throw
�� 
new
�� 
AbpException
�� &
(
��& '
string
��' -
.
��- .
Format
��. 4
(
��4 5
	localizer
��5 >
[
��> ?
$str
��? `
]
��` a
,
��a b
isActive
��c k
)
��k l
)
��l m
;
��m n
}
��  
administrativeUnit
�� 
.
�� 
ChangeState
�� *
(
��* +
isActive
��+ 3
)
��3 4
;
��4 5
return
��  
administrativeUnit
�� %
;
��% &
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� "
UnidadAdministrativa
�� .
>
��. /%
AgregarFuncionarioAsync
��0 G
(
��G H
Guid
��H L$
unidadAdministrativaId
��M c
,
��c d
Guid
��e i
	usuarioId
��j s
,
��s t
string
��u {

positionId��| �
)��� �
{
�� 	
Check
�� 
.
�� 
NotNull
�� 
(
�� $
unidadAdministrativaId
�� 0
,
��0 1
nameof
��2 8
(
��8 9$
unidadAdministrativaId
��9 O
)
��O P
)
��P Q
;
��Q R
Check
�� 
.
�� 
NotNull
�� 
(
�� 
	usuarioId
�� #
,
��# $
nameof
��% +
(
��+ ,
	usuarioId
��, 5
)
��5 6
)
��6 7
;
��7 8
var
�� 
consulta
�� 
=
�� 
await
��  

repository
��! +
.
��+ ,
WithDetailsAsync
��, <
(
��< =
x
��= >
=>
��? A
x
��B C
.
��C D
Funcionarios
��D P
)
��P Q
;
��Q R
consulta
�� 
=
�� 
consulta
�� 
.
��  
Where
��  %
(
��% &
au
��& (
=>
��) +
au
��, .
.
��. /
Id
��/ 1
==
��2 4$
unidadAdministrativaId
��5 K
)
��K L
;
��L M
var
��  
administrativeUnit
�� "
=
��# $
await
��% *
AsyncExecuter
��+ 8
.
��8 9"
SingleOrDefaultAsync
��9 M
(
��M N
consulta
��N V
)
��V W
;
��W X
if
�� 
(
��  
administrativeUnit
�� "
==
��# %
null
��& *
)
��* +
{
�� 
throw
�� 
new
�� %
EntityNotFoundException
�� 1
(
��1 2
typeof
��2 8
(
��8 9
Mre
��9 <
.
��< =
Sb
��= ?
.
��? @"
UnidadAdministrativa
��@ T
.
��T U
Dominio
��U \
.
��\ ]"
UnidadAdministrativa
��] q
)
��q r
,
��r s%
unidadAdministrativaId��t �
)��� �
;��� �
}
�� 
var
�� 
exist
�� 
=
�� 
await
�� $
ExisteFuncionarioAsync
�� 4
(
��4 5
	usuarioId
��5 >
)
��> ?
;
��? @
if
�� 
(
�� 
exist
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
UserFriendlyException
�� /
(
��/ 0
string
��0 6
.
��6 7
Format
��7 =
(
��= >
	localizer
��> G
[
��G H
$str
��H m
]
��m n
)
��n o
)
��o p
;
��p q
}
��  
administrativeUnit
�� 
.
��  
AgregarFuncionario
�� 1
(
��1 2
	usuarioId
��2 ;
,
��; <

positionId
��= G
)
��G H
;
��H I
return
��  
administrativeUnit
�� %
;
��% &
}
�� 	
public
�� 
virtual
�� 
async
�� 
Task
�� !
<
��! "
bool
��" &
>
��& '$
ExisteFuncionarioAsync
��( >
(
��> ?
Guid
��? C
userId
��D J
)
��J K
{
�� 	
Check
�� 
.
�� 
NotNull
�� 
(
�� 
userId
��  
,
��  !
nameof
��" (
(
��( )
userId
��) /
)
��/ 0
)
��0 1
;
��1 2
var
�� 
	queryable
�� 
=
�� 
await
�� !6
(administrativeUnitFunctionaryRespository
��" J
.
��J K
GetQueryableAsync
��K \
(
��\ ]
)
��] ^
;
��^ _
	queryable
�� 
=
�� 
	queryable
�� !
.
��! "
Where
��" '
(
��' (
p
��( )
=>
��* ,
p
��- .
.
��. /
	UsuarioId
��/ 8
==
��9 ;
userId
��< B
)
��B C
;
��C D
return
�� 
	queryable
�� 
.
�� 
Any
��  
(
��  !
)
��! "
;
��" #
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� "
UnidadAdministrativa
�� .
>
��. /&
EliminarFuncionarioAsync
��0 H
(
��H I
Guid
��I M$
unidadAdministrativaId
��N d
,
��d e
Guid
��f j
userId
��k q
)
��q r
{
�� 	
Check
�� 
.
�� 
NotNull
�� 
(
�� $
unidadAdministrativaId
�� 0
,
��0 1
nameof
��2 8
(
��8 9$
unidadAdministrativaId
��9 O
)
��O P
)
��P Q
;
��Q R
Check
�� 
.
�� 
NotNull
�� 
(
�� 
userId
��  
,
��  !
nameof
��" (
(
��( )
userId
��) /
)
��/ 0
)
��0 1
;
��1 2
var
�� $
queryableFunctionaries
�� &
=
��' (
await
��) .6
(administrativeUnitFunctionaryRespository
��/ W
.
��W X
GetQueryableAsync
��X i
(
��i j
)
��j k
;
��k l
var
��  
queryFunctionaries
�� "
=
��# $$
queryableFunctionaries
��% ;
.
��; <
Where
��< A
(
��A B
f
��B C
=>
��D F
f
��G H
.
��H I$
UnidadAdministrativaId
��I _
==
��` b$
unidadAdministrativaId
��c y
&&
��z |
f
��} ~
.
��~ 
	UsuarioId�� �
==��� �
userId��� �
)��� �
;��� �
var
�� +
administrativeUnitFunctionary
�� -
=
��. /
await
��0 5
AsyncExecuter
��6 C
.
��C D!
FirstOrDefaultAsync
��D W
(
��W X 
queryFunctionaries
��X j
)
��j k
;
��k l
if
�� 
(
�� +
administrativeUnitFunctionary
�� -
==
��. 0
null
��1 5
)
��5 6
{
�� 
throw
�� 
new
�� %
EntityNotFoundException
�� 1
(
��1 2
typeof
��2 8
(
��8 9-
UnidadAdministrativaFuncionario
��9 X
)
��X Y
,
��Y Z$
unidadAdministrativaId
��[ q
)
��q r
;
��r s
}
�� 
var
�� 
esSignatario
�� 
=
�� 
await
�� $
EsSignatario
��% 1
(
��1 2
userId
��2 8
,
��8 9$
unidadAdministrativaId
��: P
)
��P Q
;
��Q R
if
�� 
(
�� 
esSignatario
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
UserFriendlyException
�� /
(
��/ 0
string
��0 6
.
��6 7
Format
��7 =
(
��= >
	localizer
��> G
[
��G H
$str
��H p
]
��p q
)
��q r
)
��r s
;
��s t
}
�� 
var
�� 
	queryable
�� 
=
�� 
await
�� !

repository
��" ,
.
��, -
WithDetailsAsync
��- =
(
��= >
x
��> ?
=>
��@ B
x
��C D
.
��D E
Funcionarios
��E Q
)
��Q R
;
��R S
var
�� 
query
�� 
=
�� 
	queryable
�� !
.
��! "
Where
��" '
(
��' (
ua
��( *
=>
��+ -
ua
��. 0
.
��0 1
Id
��1 3
==
��4 6$
unidadAdministrativaId
��7 M
)
��M N
;
��N O
var
��  
administrativeUnit
�� "
=
��# $
await
��% *
AsyncExecuter
��+ 8
.
��8 9"
SingleOrDefaultAsync
��9 M
(
��M N
query
��N S
)
��S T
;
��T U
if
�� 
(
��  
administrativeUnit
�� "
.
��" #
JefeMisionId
��# /
!=
��0 2
null
��3 7
)
��7 8
{
�� 
if
�� 
(
��  
administrativeUnit
�� &
.
��& '
JefeMisionId
��' 3
==
��4 6
userId
��7 =
)
��= >
{
�� 
throw
�� 
new
�� #
UserFriendlyException
�� 3
(
��3 4
string
��4 :
.
��: ;
Format
��; A
(
��A B
	localizer
��B K
[
��K L
$str
��L t
]
��t u
)
��u v
)
��v w
;
��w x
}
�� 
}
��  
administrativeUnit
�� 
.
�� !
EliminarFuncionario
�� 2
(
��2 3
userId
��3 9
)
��9 :
;
��: ;
return
��  
administrativeUnit
�� %
;
��% &
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� "
UnidadAdministrativa
�� .
>
��. /%
AssignMissionChiefAsync
��0 G
(
��G H
Guid
��H L
id
��M O
,
��O P
Guid
��Q U
userId
��V \
)
��\ ]
{
�� 	
Check
�� 
.
�� 
NotNull
�� 
(
�� 
id
�� 
,
�� 
nameof
�� $
(
��$ %
id
��% '
)
��' (
)
��( )
;
��) *
Check
�� 
.
�� 
NotNull
�� 
(
�� 
userId
��  
,
��  !
nameof
��" (
(
��( )
userId
��) /
)
��/ 0
)
��0 1
;
��1 2
var
�� 
	queryable
�� 
=
�� 
await
�� !

repository
��" ,
.
��, -
GetQueryableAsync
��- >
(
��> ?
)
��? @
;
��@ A
	queryable
�� 
=
�� 
	queryable
�� !
.
��! "
Where
��" '
(
��' (
ua
��( *
=>
��+ -
ua
��. 0
.
��0 1
Id
��1 3
==
��4 6
id
��7 9
)
��9 :
;
��: ;
var
��  
administrativeUnit
�� "
=
��# $
await
��% *
AsyncExecuter
��+ 8
.
��8 9!
FirstOrDefaultAsync
��9 L
(
��L M
	queryable
��M V
)
��V W
;
��W X
if
�� 
(
��  
administrativeUnit
�� "
.
��" #
JefeMisionId
��# /
!=
��0 2
null
��3 7
)
��7 8
{
�� 
if
�� 
(
��  
administrativeUnit
�� &
.
��& '
JefeMisionId
��' 3
==
��4 6
userId
��7 =
)
��= >
{
�� 
throw
�� 
new
�� #
UserFriendlyException
�� 3
(
��3 4
string
��4 :
.
��: ;
Format
��; A
(
��A B
	localizer
��B K
[
��K L
$str
��L t
]
��t u
)
��u v
)
��v w
;
��w x
}
�� 
}
��  
administrativeUnit
�� 
.
�� 
AddMissionChief
�� .
(
��. /
userId
��/ 5
)
��5 6
;
��6 7
return
��  
administrativeUnit
�� %
;
��% &
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� "
UnidadAdministrativa
�� .
>
��. /$
AgregarSignatarioAsync
��0 F
(
��F G
Guid
��G K"
administrativeUnitId
��L `
,
��` a
Guid
��b f
userId
��g m
,
��m n
Guid
��o s
	serviceId
��t }
,
��} ~
bool�� �

porDefecto��� �
=��� �
false��� �
)��� �
{
�� 	
Check
�� 
.
�� 
NotNull
�� 
(
�� "
administrativeUnitId
�� .
,
��. /
nameof
��0 6
(
��6 7"
administrativeUnitId
��7 K
)
��K L
)
��L M
;
��M N
Check
�� 
.
�� 
NotNull
�� 
(
�� 
userId
��  
,
��  !
nameof
��" (
(
��( )
userId
��) /
)
��/ 0
)
��0 1
;
��1 2
Check
�� 
.
�� 
NotNull
�� 
(
�� 
	serviceId
�� #
,
��# $
nameof
��% +
(
��+ ,
	serviceId
��, 5
)
��5 6
)
��6 7
;
��7 8
var
�� 

isAssigned
�� 
=
�� 
await
�� " 
SignatarioAsignado
��# 5
(
��5 6"
administrativeUnitId
��6 J
,
��J K
userId
��L R
,
��R S
	serviceId
��T ]
)
��] ^
;
��^ _
if
�� 
(
�� 

isAssigned
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
UserFriendlyException
�� /
(
��/ 0
string
��0 6
.
��6 7
Format
��7 =
(
��= >
	localizer
��> G
[
��G H
$str
��H r
]
��r s
)
��s t
)
��t u
;
��u v
}
�� 
var
�� 
	queryable
�� 
=
�� 
await
�� !

repository
��" ,
.
��, -
WithDetailsAsync
��- =
(
��= >
x
��> ?
=>
��@ B
x
��C D
.
��D E
Signatarios
��E P
)
��P Q
;
��Q R
var
�� 
query
�� 
=
�� 
	queryable
�� !
.
��! "
Where
��" '
(
��' (
au
��( *
=>
��+ -
au
��. 0
.
��0 1
Id
��1 3
==
��4 6"
administrativeUnitId
��7 K
)
��K L
;
��L M
var
��  
administrativeUnit
�� "
=
��# $
await
��% *
AsyncExecuter
��+ 8
.
��8 9"
SingleOrDefaultAsync
��9 M
(
��M N
query
��N S
)
��S T
;
��T U
if
�� 
(
��  
administrativeUnit
�� "
==
��# %
null
��& *
)
��* +
{
�� 
throw
�� 
new
�� %
EntityNotFoundException
�� 1
(
��1 2
typeof
��2 8
(
��8 9"
UnidadAdministrativa
��9 M
)
��M N
,
��N O"
administrativeUnitId
��P d
)
��d e
;
��e f
}
�� 
if
�� 
(
�� 

porDefecto
�� 
)
�� 
{
�� 
var
�� 
existeOtroDefecto
�� %
=
��& ' 
administrativeUnit
��( :
.
��: ;
Signatarios
��; F
.
��F G
Any
��G J
(
��J K
x
��K L
=>
��M O
x
��P Q
.
��Q R

PorDefecto
��R \
)
��\ ]
;
��] ^
if
�� 
(
�� 
existeOtroDefecto
�� %
)
��% &
{
�� 
throw
�� 
new
�� #
UserFriendlyException
�� 3
(
��3 4
string
��4 :
.
��: ;
Format
��; A
(
��A B
	localizer
��B K
[
��K L
$str
��L s
]
��s t
)
��t u
)
��u v
;
��v w
}
�� 
}
��  
administrativeUnit
�� 
.
�� 
AgregarSignatario
�� 0
(
��0 1
userId
��1 7
,
��7 8
	serviceId
��9 B
,
��B C

porDefecto
��D N
)
��N O
;
��O P
return
��  
administrativeUnit
�� %
;
��% &
}
�� 	
public
�� 
virtual
�� 
async
�� 
Task
�� !
<
��! "
bool
��" &
>
��& ' 
SignatarioAsignado
��( :
(
��: ;
Guid
��; ?"
administrativeUnitId
��@ T
,
��T U
Guid
��V Z
userId
��[ a
,
��a b
Guid
��c g
	serviceId
��h q
)
��q r
{
�� 	
Check
�� 
.
�� 
NotNull
�� 
(
�� "
administrativeUnitId
�� .
,
��. /
nameof
��0 6
(
��6 7"
administrativeUnitId
��7 K
)
��K L
)
��L M
;
��M N
Check
�� 
.
�� 
NotNull
�� 
(
�� 
userId
��  
,
��  !
nameof
��" (
(
��( )
userId
��) /
)
��/ 0
)
��0 1
;
��1 2
var
�� 
	queryable
�� 
=
�� 
await
�� !1
#administrativeUnitSignerRespository
��" E
.
��E F
GetQueryableAsync
��F W
(
��W X
)
��X Y
;
��Y Z
	queryable
�� 
=
�� 
	queryable
�� !
.
��! "
Where
��" '
(
��' (
p
��( )
=>
��* ,
p
��- .
.
��. /$
UnidadAdministrativaId
��/ E
==
��F H"
administrativeUnitId
��I ]
)
��] ^
;
��^ _
	queryable
�� 
=
�� 
	queryable
�� !
.
��! "
Where
��" '
(
��' (
p
��( )
=>
��* ,
p
��- .
.
��. /
	UsuarioId
��/ 8
==
��9 ;
userId
��< B
)
��B C
;
��C D
	queryable
�� 
=
�� 
	queryable
�� !
.
��! "
Where
��" '
(
��' (
p
��( )
=>
��* ,
p
��- .
.
��. /

ServicioId
��/ 9
==
��: <
	serviceId
��= F
)
��F G
;
��G H
return
�� 
	queryable
�� 
.
�� 
Any
��  
(
��  !
)
��! "
;
��" #
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� "
UnidadAdministrativa
�� .
>
��. /%
EliminarSignatarioAsync
��0 G
(
��G H
Guid
��H L
id
��M O
,
��O P
Guid
��Q U
userId
��V \
,
��\ ]
Guid
��^ b
	serviceId
��c l
)
��l m
{
�� 	
Check
�� 
.
�� 
NotNull
�� 
(
�� 
id
�� 
,
�� 
nameof
�� $
(
��$ %
id
��% '
)
��' (
)
��( )
;
��) *
Check
�� 
.
�� 
NotNull
�� 
(
�� 
userId
��  
,
��  !
nameof
��" (
(
��( )
userId
��) /
)
��/ 0
)
��0 1
;
��1 2
Check
�� 
.
�� 
NotNull
�� 
(
�� 
	serviceId
�� #
,
��# $
nameof
��% +
(
��+ ,
	serviceId
��, 5
)
��5 6
)
��6 7
;
��7 8
var
�� 
queryableSigners
��  
=
��! "
await
��# (1
#administrativeUnitSignerRespository
��) L
.
��L M
GetQueryableAsync
��M ^
(
��^ _
)
��_ `
;
��` a
queryableSigners
�� 
=
�� 
queryableSigners
�� /
.
��/ 0
Where
��0 5
(
��5 6
s
��6 7
=>
��8 :
s
��; <
.
��< =$
UnidadAdministrativaId
��= S
==
��T V
id
��W Y
&&
��Z \
s
��] ^
.
��^ _

ServicioId
��_ i
==
��j l
	serviceId
��m v
&&
��w y
s
��z {
.
��{ |
	UsuarioId��| �
==��� �
userId��� �
)��� �
;��� �
var
�� '
administrativeUnitService
�� )
=
��* +
await
��, 1
AsyncExecuter
��2 ?
.
��? @"
SingleOrDefaultAsync
��@ T
(
��T U
queryableSigners
��U e
)
��e f
;
��f g
if
�� 
(
�� '
administrativeUnitService
�� )
==
��* ,
null
��- 1
)
��1 2
{
�� 
throw
�� 
new
�� %
EntityNotFoundException
�� 1
(
��1 2
typeof
��2 8
(
��8 9-
UnidadAdministrativaFuncionario
��9 X
)
��X Y
,
��Y Z
id
��[ ]
)
��] ^
;
��^ _
}
�� 
var
�� 7
)usuarioPoseeConfiguracionFirmaElectronica
�� 9
=
��: ;
await
��< A,
configuracionSignatarioManager
��B `
.
��` a&
PoseenConfiguracionAsync
��a y
(
��y z
userId��z �
)��� �
;��� �
if
�� 
(
�� 7
)usuarioPoseeConfiguracionFirmaElectronica
�� 9
)
��9 :
{
�� 
throw
�� 
new
�� #
UserFriendlyException
�� /
(
��/ 0
string
��0 6
.
��6 7
Format
��7 =
(
��= >
	localizer
��> G
[
��G H
$str
��H t
]
��t u
)
��u v
)
��v w
;
��w x
}
�� 
var
�� 
	queryable
�� 
=
�� 
await
�� !

repository
��" ,
.
��, -
WithDetailsAsync
��- =
(
��= >
x
��> ?
=>
��@ B
x
��C D
.
��D E
Signatarios
��E P
)
��P Q
;
��Q R
var
�� 
query
�� 
=
�� 
	queryable
�� !
.
��! "
Where
��" '
(
��' (
ua
��( *
=>
��+ -
ua
��. 0
.
��0 1
Id
��1 3
==
��4 6
id
��7 9
)
��9 :
;
��: ;
var
��  
administrativeUnit
�� "
=
��# $
await
��% *
AsyncExecuter
��+ 8
.
��8 9"
SingleOrDefaultAsync
��9 M
(
��M N
query
��N S
)
��S T
;
��T U 
administrativeUnit
�� 
.
��  
EliminarSignatario
�� 1
(
��1 2
userId
��2 8
,
��8 9
	serviceId
��: C
)
��C D
;
��D E
return
��  
administrativeUnit
�� %
;
��% &
}
�� 	
public
�� 
virtual
�� 
async
�� 
Task
�� !
<
��! "
bool
��" &
>
��& '
EsSignatario
��( 4
(
��4 5
Guid
��5 9
userId
��: @
,
��@ A
Guid
��B F
?
��F G"
administrativeUnitId
��H \
=
��\ ]
null
��] a
)
��a b
{
�� 	
Check
�� 
.
�� 
NotNull
�� 
(
�� 
userId
��  
,
��  !
nameof
��" (
(
��( )
userId
��) /
)
��/ 0
)
��0 1
;
��1 2
var
�� 
	queryable
�� 
=
�� 
await
�� !1
#administrativeUnitSignerRespository
��" E
.
��E F
GetQueryableAsync
��F W
(
��W X
)
��X Y
;
��Y Z
	queryable
�� 
=
�� 
	queryable
�� !
.
��! "
Where
��" '
(
��' (
p
��( )
=>
��* ,
p
��- .
.
��. /
	UsuarioId
��/ 8
==
��9 ;
userId
��< B
)
��B C
;
��C D
	queryable
�� 
=
�� 
	queryable
�� !
.
��! "
WhereIf
��" )
(
��) *"
administrativeUnitId
�� '
.
��' (
HasValue
��( 0
,
��0 1
p
�� 
=>
�� 
p
�� 
.
�� $
UnidadAdministrativaId
�� 0
==
��1 3"
administrativeUnitId
��4 H
)
�� 
;
�� 
return
�� 
	queryable
�� 
.
�� 
Any
��  
(
��  !
)
��! "
;
��" #
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� "
UnidadAdministrativa
�� .
>
��. /"
AgregarServicioAsync
��0 D
(
��D E
Guid
��E I
id
��J L
,
��L M
Guid
��N R
	serviceId
��S \
,
��\ ]
string
��^ d
paymentType
��e p
,
��p q
bool
��q u
isActive
��v ~
)
��~ 
{
�� 	
Check
�� 
.
�� 
NotNull
�� 
(
�� 
id
�� 
,
�� 
nameof
�� $
(
��$ %
id
��% '
)
��' (
)
��( )
;
��) *
Check
�� 
.
�� 
NotNull
�� 
(
�� 
	serviceId
�� #
,
��# $
nameof
��% +
(
��+ ,
	serviceId
��, 5
)
��5 6
)
��6 7
;
��7 8
var
�� 
	queryable
�� 
=
�� 
await
�� !

repository
��" ,
.
��, -
GetQueryableAsync
��- >
(
��> ?
)
��? @
;
��@ A
var
�� 
query
�� 
=
�� 
	queryable
�� !
.
��! "
Where
��" '
(
��' (
au
��( *
=>
��+ -
au
��. 0
.
��0 1
Id
��1 3
==
��4 6
id
��7 9
)
��9 :
;
��: ;
var
��  
administrativeUnit
�� "
=
��# $
await
��& +
AsyncExecuter
��, 9
.
��9 :"
SingleOrDefaultAsync
��: N
(
��N O
query
��O T
)
��T U
;
��U V
if
�� 
(
��  
administrativeUnit
�� "
==
��# %
null
��& *
)
��* +
{
�� 
throw
�� 
new
�� %
EntityNotFoundException
�� 1
(
��1 2
typeof
��2 8
(
��8 9
Mre
��9 <
.
��< =
Sb
��= ?
.
��? @"
UnidadAdministrativa
��@ T
.
��T U
Dominio
��U \
.
��\ ]"
UnidadAdministrativa
��] q
)
��q r
,
��r s
id
��t v
)
��v w
;
��w x
}
�� 
var
�� 
exist
�� 
=
�� 
await
�� !
ExisteServicioAsync
�� 1
(
��1 2
id
��2 4
,
��4 5
	serviceId
��5 >
)
��> ?
;
��? @
if
�� 
(
�� 
exist
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
UserFriendlyException
�� /
(
��/ 0
string
��0 6
.
��6 7
Format
��7 =
(
��= >
	localizer
��> G
[
��G H
$str
��H i
]
��i j
)
��j k
)
��k l
;
��l m
}
��  
administrativeUnit
�� 
.
�� 
AgregarServicio
�� .
(
��. /
	serviceId
��/ 8
,
��8 9
paymentType
��: E
,
��E F
isActive
��F N
)
��N O
;
��O P
return
��  
administrativeUnit
�� %
;
��% &
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� "
UnidadAdministrativa
�� .
>
��. /#
EliminarServicioAsync
��0 E
(
��E F
Guid
��F J
id
��K M
,
��M N
Guid
��O S
	serviceId
��T ]
)
��] ^
{
�� 	
Check
�� 
.
�� 
NotNull
�� 
(
�� 
id
�� 
,
�� 
nameof
�� $
(
��$ %
id
��% '
)
��' (
)
��( )
;
��) *
Check
�� 
.
�� 
NotNull
�� 
(
�� 
	serviceId
�� #
,
��# $
nameof
��% +
(
��+ ,
	serviceId
��, 5
)
��5 6
)
��6 7
;
��7 8
var
�� 
queryableServices
�� !
=
��" #
await
��$ )2
$administrativeUnitServiceRespository
��* N
.
��N O
GetQueryableAsync
��O `
(
��` a
)
��a b
;
��b c
queryableServices
�� 
=
�� 
queryableServices
��  1
.
��1 2
Where
��2 7
(
��7 8
s
��8 9
=>
��: <
s
��= >
.
��> ?$
UnidadAdministrativaId
��? U
==
��V X
id
��Y [
&&
��\ ^
s
��_ `
.
��` a

ServicioId
��a k
==
��l n
	serviceId
��o x
)
��x y
;
��y z
var
�� '
administrativeUnitService
�� )
=
��* +
await
��, 1
AsyncExecuter
��2 ?
.
��? @!
FirstOrDefaultAsync
��@ S
(
��S T
queryableServices
��T e
)
��e f
;
��f g
if
�� 
(
�� '
administrativeUnitService
�� )
==
��* ,
null
��- 1
)
��1 2
{
�� 
throw
�� 
new
�� %
EntityNotFoundException
�� 1
(
��1 2
typeof
��2 8
(
��8 9-
UnidadAdministrativaFuncionario
��9 X
)
��X Y
,
��Y Z
id
��[ ]
)
��] ^
;
��^ _
}
�� 
var
�� 
	queryable
�� 
=
�� 
await
�� !

repository
��" ,
.
��, -
WithDetailsAsync
��- =
(
��= >
x
��> ?
=>
��@ B
x
��C D
.
��D E
	Servicios
��E N
)
��N O
;
��O P
var
�� 
query
�� 
=
�� 
	queryable
�� !
.
��! "
Where
��" '
(
��' (
ua
��( *
=>
��+ -
ua
��. 0
.
��0 1
Id
��1 3
==
��4 6
id
��7 9
)
��9 :
;
��: ;
var
��  
administrativeUnit
�� "
=
��# $
await
��% *
AsyncExecuter
��+ 8
.
��8 9"
SingleOrDefaultAsync
��9 M
(
��M N
query
��N S
)
��S T
;
��T U 
administrativeUnit
�� 
.
�� 
EliminarServicio
�� /
(
��/ 0
	serviceId
��0 9
)
��9 :
;
��: ;
return
��  
administrativeUnit
�� %
;
��% &
}
�� 	
public
�� 
virtual
�� 
async
�� 
Task
�� !
<
��! "
bool
��" &
>
��& '!
ExisteServicioAsync
��( ;
(
��; <
Guid
��< @"
administrativeUnitId
��A U
,
��U V
Guid
��W [
	serviceId
��\ e
)
��e f
{
�� 	
Check
�� 
.
�� 
NotNull
�� 
(
�� "
administrativeUnitId
�� .
,
��. /
nameof
��0 6
(
��6 7"
administrativeUnitId
��7 K
)
��K L
)
��L M
;
��M N
Check
�� 
.
�� 
NotNull
�� 
(
�� 
	serviceId
�� #
,
��# $
nameof
��% +
(
��+ ,
	serviceId
��, 5
)
��5 6
)
��6 7
;
��7 8
var
�� 
	queryable
�� 
=
�� 
await
�� !2
$administrativeUnitServiceRespository
��" F
.
��F G
GetQueryableAsync
��G X
(
��X Y
)
��Y Z
;
��Z [
	queryable
�� 
=
�� 
	queryable
�� !
.
��! "
Where
��" '
(
��' (
p
��( )
=>
��* ,
p
��- .
.
��. /$
UnidadAdministrativaId
��/ E
==
��F H"
administrativeUnitId
��I ]
)
��] ^
;
��^ _
	queryable
�� 
=
�� 
	queryable
�� !
.
��! "
Where
��" '
(
��' (
p
��( )
=>
��* ,
p
��- .
.
��. /

ServicioId
��/ 9
==
��: <
	serviceId
��= F
)
��F G
;
��G H
return
�� 
	queryable
�� 
.
�� 
Any
��  
(
��  !
)
��! "
;
��" #
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� "
UnidadAdministrativa
�� .
>
��. /)
EstablecerJurisdiccionAsync
��0 K
(
��K L"
UnidadAdministrativa
��L `"
unidadAdministrativa
��a u
,
��u v
IEnumerable��w �
<��� �
string��� �
>��� �$
ciudadesJurisdiccion��� �
)��� �
{
�� 	
Check
�� 
.
�� 
NotNull
�� 
(
�� "
unidadAdministrativa
�� .
,
��. /
nameof
��0 6
(
��6 7"
unidadAdministrativa
��7 K
)
��K L
)
��L M
;
��M N
Check
�� 
.
�� 
NotNull
�� 
(
�� "
ciudadesJurisdiccion
�� .
,
��. /
nameof
��0 6
(
��6 7"
ciudadesJurisdiccion
��7 K
)
��K L
)
��L M
;
��M N
var
�� *
ciudadesJurisdiccionActuales
�� ,
=
��- ."
unidadAdministrativa
��/ C
.
��C D
Jurisdiccion
��D P
.
��P Q
Select
��Q W
(
��W X
j
��X Y
=>
��Z \
j
��] ^
.
��^ _
Ciudad
��_ e
)
��e f
;
��f g
if
�� 
(
�� "
ciudadesJurisdiccion
�� $
.
��$ %
Any
��% (
(
��( )
)
��) *
)
��* +
{
�� "
unidadAdministrativa
�� $
.
��$ %"
EliminarJurisdiccion
��% 9
(
��9 :*
ciudadesJurisdiccionActuales
��: V
.
��V W
Except
��W ]
(
��] ^"
ciudadesJurisdiccion
��^ r
)
��r s
.
��s t
Distinct
��t |
(
��| }
)
��} ~
)
��~ 
;�� �"
unidadAdministrativa
�� $
.
��$ %!
AgregarJurisdiccion
��% 8
(
��8 9"
ciudadesJurisdiccion
��9 M
.
��M N
Except
��N T
(
��T U*
ciudadesJurisdiccionActuales
��U q
)
��q r
.
��r s
Distinct
��s {
(
��{ |
)
��| }
)
��} ~
;
��~ 
}
�� 
else
�� 
{
�� "
unidadAdministrativa
�� $
.
��$ %"
EliminarJurisdiccion
��% 9
(
��9 :*
ciudadesJurisdiccionActuales
��: V
.
��V W
Distinct
��W _
(
��_ `
)
��` a
)
��a b
;
��b c
}
�� 
return
�� 
await
�� 
Task
�� 
.
�� 

FromResult
�� (
(
��( )"
unidadAdministrativa
��) =
)
��= >
;
��> ?
}
�� 	
}
�� 
}�� �
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
}// �
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
} �
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
isVirtualAttention	n �
,
� �
string
� �
attentionStart
� �
,
� �
string
� �
attentionEnd
� �
,
� �
bool
� �
isActive
� �
)
� �
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
}<< �0
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
AdministrativeUnitResource	j �
>
� �
	localizer
� �
)
� �
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
� �
)
� �
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
isPresentialAttention	''m �
:
''� �#
isPresentialAttention
''� �
,
''� � 
isVirtualAttention
''� �
:
''� � 
isVirtualAttention
''� �
,
''� �
attentionStart
''� �
:
''� �
attentionStart
''� �
,
''� �
attentionEnd
''� �
:
''� �
attentionEnd
''� �
,
''� �
isActive
''� �
:
''� �
isActive
''� �
)
''� �
;
''� �
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