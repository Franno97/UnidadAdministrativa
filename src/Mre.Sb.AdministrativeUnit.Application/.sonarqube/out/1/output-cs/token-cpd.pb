»
ÖD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\AdministrativeUnitApplicationContractsModule.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
{ 
[ 
	DependsOn 
( 
typeof 
( 0
$AdministrativeUnitDomainSharedModule 3
)3 4
,4 5
typeof		 
(		 ,
 AbpDddApplicationContractsModule		 /
)		/ 0
,		0 1
typeof

 
(

 "
AbpAuthorizationModule

 %
)

% &
) 	
]	 

public 

class 8
,AdministrativeUnitApplicationContractsModule =
:> ?
	AbpModule@ I
{ 
} 
} ¶
~D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\AdministrativeUnitRemoteServiceConsts.cs
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
class 1
%AdministrativeUnitRemoteServiceConsts =
{ 
public 
const 
string 
RemoteServiceName -
=. /
$str0 F
;F G
} 
} ú
kD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Arancel\ArancelDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{		 
public

 

class

 

ArancelDto

 
:

 

IEntityDto

 (
<

( )
Guid

) -
>

- .
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( ) 
MaxDescriptionLength) =
)= >
]> ?
public 
virtual 
string 
Descripcion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
[ 	
Required	 
] 
public 
string 
MonedaId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Moneda 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
Required	 
] 
public 
bool 
Activo 
{ 
get  
;  !
set" %
;% &
}' (
} 
public 

class 
ArancelLookupDto !
:" #
	EntityDto$ -
<- .
Guid. 2
>2 3
{ 
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
} 
}   »	
zD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Arancel\CrearActualizarArancelDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{ 
public 

class %
CrearActualizarArancelDto *
{+ ,
[ 	
Required	 
] 
[		 	
StringLength			 
(		 
DomainCommonConsts		 (
.		( ) 
MaxDescriptionLength		) =
)		= >
]		> ?
public

 
virtual

 
string

 
Descripcion

 )
{

* +
get

, /
;

/ 0
set

1 4
;

4 5
}

6 7
[ 	
Required	 
] 
public 
string 
MonedaId 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
public 
bool 
Activo 
{ 
get  
;  !
set" %
;% &
}' (
} 
} î
áD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Arancel\CrearActualizarJerarquiaArancelariaDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{ 
public 

class 2
&CrearActualizarJerarquiaArancelariaDto 7
{ 
[

 	
Required

	 
]

 
public 
Guid 
	ArancelId 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Required	 
] 
public 
virtual 
string 
TipoArancelId +
{, -
get. 1
;1 2
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
.( ) 
MaxDescriptionLength) =
)= >
]> ?
public 
virtual 
string 
Descripcion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
[ 	
Required	 
] 
public 
virtual 
int 
Orden  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
virtual 
int 
NumeroJerarquia *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
} 
} ∏
ÖD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Arancel\CrearActualizarPartidaArancelariaDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{ 
public 

class 0
$CrearActualizarPartidaArancelariaDto 5
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
( 
DomainCommonConsts (
.( ) 
MaxDescriptionLength) =
)= >
]> ?
public 
virtual 
string 
Descripcion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
[ 	
Required	 
] 
[ 	
StringLength	 
( 
TariffHeadingConsts )
.) */
#MaxTariffHeadingHeadingNumberLength* M
)M N
]N O
public 
virtual 
string 
NumeroPartida +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
[ 	
Required	 
] 
public 
virtual 
decimal 
Valor $
{% &
get' *
;* +
set, /
;/ 0
}1 2
[ 	
Required	 
] 
public 
virtual 
Guid "
JerarquiaArancelariaId 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
} 
} Ã
ÉD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Arancel\CrearPartidaArancelariaServicioDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{ 
public 

class .
"CrearPartidaArancelariaServicioDto 3
{ 
public		 
Guid		 

ServicioId		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
}

 
} ¯
}D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Arancel\GetJerarquiaArancelariaInput.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{ 
public 

class (
GetJerarquiaArancelariaInput -
:. /*
PagedAndSortedResultRequestDto0 N
{ 
public 
string 
Filter 
{ 
get "
;" #
set$ '
;' (
}) *
} 
}

 Ù
{D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Arancel\GetPartidaArancelariaInput.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{ 
public 

class &
GetPartidaArancelariaInput +
:, -*
PagedAndSortedResultRequestDto. L
{ 
public 
string 
Filter 
{ 
get "
;" #
set$ '
;' (
}) *
} 
}

 Û
sD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Arancel\IArancelAppService.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{		 
public

 

	interface

 
IArancelAppService

 '
:

( )
ICrudAppService 
< 

ArancelDto  
,  !
Guid
 
, 
ObtenerArancelInput
 
, %
CrearActualizarArancelDto
 #
># $
{ 
Task 
< 
ListResultDto 
< 
ArancelLookupDto +
>+ ,
>, -
GetLookupAsync. <
(< =
)= >
;> ?
Task 
ChangeStateAsync 
( 
Guid "
id# %
,% &
bool' +
isActive, 4
)4 5
;5 6
Task 
< 
PagedResultDto 
< #
JerarquiaArancelariaDto 3
>3 4
>4 5.
"ObtenerJerarquiasArancelariasAsync6 X
(X Y
GuidY ]
	arancelId^ g
,g h)
GetJerarquiaArancelariaInput	i Ö
input
Ü ã
)
ã å
;
å ç
Task 
< #
JerarquiaArancelariaDto $
>$ %,
 ObtenerJerarquiaArancelariaAsync& F
(F G
GuidG K
	arancelIdL U
,U V
GuidW [
jerarquiaId\ g
)g h
;h i
Task 
< #
JerarquiaArancelariaDto $
>$ %,
 AgregarJerarquiaArancelariaAsync& F
(F G
GuidG K
	arancelIdL U
,U V2
&CrearActualizarJerarquiaArancelariaDtoW }
input	~ É
)
É Ñ
;
Ñ Ö
Task 
< #
JerarquiaArancelariaDto $
>$ %/
#ActualizarJerarquiaArancelariaAsync& I
(I J
GuidJ N
	arancelIdO X
,X Y
GuidZ ^
jerarquiaId_ j
,j k3
&CrearActualizarJerarquiaArancelariaDto	l í
input
ì ò
)
ò ô
;
ô ö
Task +
QuitarJerarquiaArancelariaAsync ,
(, -
Guid- 1
	arancelId2 ;
,; <
Guid= A
jerarquiaIdB M
)M N
;N O
}$$ 
}&& Œ
ÄD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Arancel\IJerarquiaArancelariaAppService.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{		 
public

 

	interface

 +
IJerarquiaArancelariaAppService

 4
:

5 6
ICrudAppService 
< #
JerarquiaArancelariaDto -
,- .
Guid
 
, (
GetJerarquiaArancelariaInput
 &
,& '2
&CrearActualizarJerarquiaArancelariaDto
 0
>0 1
{ 
Task 
< 
ListResultDto 
< )
JerarquiaArancelariaLookupDto 8
>8 9
>9 :
GetLookupAsync; I
(I J
)J K
;K L
Task 
< 
PagedResultDto 
< !
PartidaArancelariaDto 1
>1 2
>2 3,
 ObtenerPartidasArancelariasAsync4 T
(T U
GuidU Y"
jerarquiaArancelariaIdZ p
,p q'
GetPartidaArancelariaInput	r å
input
ç í
)
í ì
;
ì î
Task 
< !
PartidaArancelariaDto "
>" #*
ObtenerPartidaArancelariaAsync$ B
(B C
GuidC G"
jerarquiaArancelariaIdH ^
,^ _
Guid` d 
partidaArancelariaIde y
)y z
;z {
Task 
< !
PartidaArancelariaDto "
>" #*
AgregarPartidaArancelariaAsync$ B
(B C
GuidC G"
jerarquiaArancelariaIdH ^
,^ _1
$CrearActualizarPartidaArancelariaDto	` Ñ
input
Ö ä
)
ä ã
;
ã å
Task 
< !
PartidaArancelariaDto "
>" #-
!ActualizarPartidaArancelariaAsync$ E
(E F
GuidF J"
jerarquiaArancelariaIdK a
,a b
Guidc g 
partidaArancelariaIdh |
,| }1
$CrearActualizarPartidaArancelariaDto	~ ¢
input
£ ®
)
® ©
;
© ™
Task )
QuitarPartidaArancelariaAsync *
(* +
Guid+ /"
jerarquiaArancelariaId0 F
,F G
GuidH L 
partidaArancelariaIdM a
)a b
;b c
}   
}"" ‹
~D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Arancel\IPartidaArancelariaAppService.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{		 
public

 

	interface

 )
IPartidaArancelariaAppService

 2
:

3 4
ICrudAppService 
< !
PartidaArancelariaDto +
,+ ,
Guid
 
, &
GetPartidaArancelariaInput
 $
,$ %0
$CrearActualizarPartidaArancelariaDto
 .
>. /
{ 
Task 
< 
ListResultDto 
< '
PartidaArancelariaLookupDto 6
>6 7
>7 8
GetLookupAsync9 G
(G H
)H I
;I J
public 
Task 
< 
PagedResultDto "
<" #-
!PartidaArancelariaServicioInfoDto# D
>D E
>E F
GetServicesAsyncG W
(W X
GuidX \
tariffHeadingId] l
,l m6
)ObtenerPartidaArancelariaServicioInputDto	n ó
input
ò ù
)
ù û
;
û ü
public 
Task 
AddServiceAsync #
(# $
Guid$ (
tariffHeadingId) 8
,8 9.
"CrearPartidaArancelariaServicioDto: \
input] b
)b c
;c d
public 
Task 
RemoveServiceAsync &
(& '
Guid' +
tariffHeadingId, ;
,; <
Guid= A
	serviceIdB K
)K L
;L M
} 
} ‹
ÜD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Arancel\IPartidaArancelariaServicioAppService.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{		 
public

 

	interface

 1
%IPartidaArancelariaServicioAppService

 :
{ 
Task 
< 
ListResultDto 
< )
PartidaArancelariaServicioDto 8
>8 9
>9 :5
)ObtenerPartidaArancelariaPorServicioAsync; d
(d e
Guide i

servicioIdj t
)t u
;u v
} 
} ¯
wD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Arancel\ITipoArancelAppService.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{		 
public 

	interface "
ITipoArancelAppService +
:, -
ICrudAppService. =
<= >
TipoArancelDto> L
,L M
stringN T
>T U
{ 
Task 
< 
ListResultDto 
<  
TipoArancelLookupDto /
>/ 0
>0 1
GetLookupAsync2 @
(@ A
)A B
;B C
} 
} é
xD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Arancel\JerarquiaArancelariaDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{		 
public

 

class

 #
JerarquiaArancelariaDto

 (
:

) *

IEntityDto

+ 5
<

5 6
Guid

6 :
>

: ;
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
[ 	
Required	 
] 
public 
Guid 
	ArancelId 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Required	 
] 
public 
virtual 
string 
TipoArancelId +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
virtual 
string 
TipoArancel )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( ) 
MaxDescriptionLength) =
)= >
]> ?
public 
virtual 
string 
Descripcion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
[ 	
Required	 
] 
public 
virtual 
int 
Orden  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
virtual 
int 
NumeroJerarquia *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
}   
public"" 

class"" )
JerarquiaArancelariaLookupDto"" .
:""/ 0
	EntityDto""1 :
<"": ;
Guid""; ?
>""? @
{## 
public$$ 
virtual$$ 
string$$ 
Descripcion$$ )
{$$* +
get$$, /
;$$/ 0
set$$1 4
;$$4 5
}$$6 7
}%% 
}&& Ê
tD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Arancel\ObtenerArancelInput.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{ 
public 

class 
ObtenerArancelInput $
:% &*
PagedAndSortedResultRequestDto' E
{ 
public 
string 
Filter 
{ 
get "
;" #
set$ '
;' (
}) *
} 
}

 Â
äD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Arancel\ObtenerPartidaArancelariaServicioInputDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{ 
public 

class 5
)ObtenerPartidaArancelariaServicioInputDto :
:; <*
PagedAndSortedResultRequestDto= [
{		 
private

 
string

 
SortingDefault

 %
=

& '
$str

( >
;

> ?
public 5
)ObtenerPartidaArancelariaServicioInputDto 8
(8 9
)9 :
{ 	
this 
. 
Sorting 
= 
SortingDefault )
;) *
} 	
} 
} ¸
vD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Arancel\PartidaArancelariaDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{		 
public

 

class

 !
PartidaArancelariaDto

 &
:

' (

IEntityDto

) 3
<

3 4
Guid

4 8
>

8 9
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( ) 
MaxDescriptionLength) =
)= >
]> ?
public 
virtual 
string 
Descripcion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
[ 	
Required	 
] 
[ 	
StringLength	 
( 
TariffHeadingConsts )
.) */
#MaxTariffHeadingHeadingNumberLength* M
)M N
]N O
public 
virtual 
string 
NumeroPartida +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
[ 	
Required	 
] 
public 
virtual 
decimal 
Valor $
{% &
get' *
;* +
set, /
;/ 0
}1 2
[ 	
Required	 
] 
public 
virtual 
Guid "
JerarquiaArancelariaId 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
} 
public 

class '
PartidaArancelariaLookupDto ,
:- .
	EntityDto/ 8
<8 9
Guid9 =
>= >
{ 
public   
virtual   
string   
Descripcion   )
{  * +
get  , /
;  / 0
set  1 4
;  4 5
}  6 7
}!! 
}"" π
~D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Arancel\PartidaArancelariaServicioDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{		 
public

 

class

 )
PartidaArancelariaServicioDto

 .
:

/ 0

IEntityDto

1 ;
{ 
public 
Guid  
PartidaArancelariaId (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
Guid 

ServicioId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
virtual 
string 
Servicio &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
virtual 
string 
PartidaArancelaria 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
public 
virtual 
string 
NumeroPartida +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
virtual 
decimal 
Valor $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
virtual 
Guid "
JerarquiaArancelariaId 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public 
virtual 
string  
JerarquiaArancelaria 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public 
virtual 
Guid 
	ArancelId %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
virtual 
string 
Arancel %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
}   
}"" ã
ÇD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Arancel\PartidaArancelariaServicioInfoDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{ 
public		 

class		 -
!PartidaArancelariaServicioInfoDto		 2
{

 
public 
Guid 

ServicioId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Servicio 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
TipoServicio "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
bool 
AtencionPresencial &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
bool "
AtencionSemiPresencial *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
bool 
AtencionVirtual #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
bool 
Activo 
{ 
get  
;  !
set" %
;% &
}' (
} 
} »
oD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Arancel\TipoArancelDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{		 
public

 

class

 
TipoArancelDto

 
:

  !

IEntityDto

" ,
<

, -
string

- 3
>

3 4
{ 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxIdLength) 4
)4 5
]5 6
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @
Alfanumericos@ M
)M N
]N O
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxNameLength) 6
)6 7
]7 8
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @,
 AlfanumericosGuionesPuntoEspacio@ `
)` a
]a b
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
} 
public 

class  
TipoArancelLookupDto %
:& '
	EntityDto( 1
<1 2
string2 8
>8 9
{ 
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} ü
mD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Convenio\ConvenioDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{ 
public 

class 
ConvenioDto 
: 

IEntityDto )
<) *
Guid* .
>. /
{		 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( ) 
MaxDescriptionLength) =
)= >
]> ?
public 
virtual 
string 
Descripcion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
[ 	
Required	 
] 
public 
virtual 
DateTime 
FechaCreacion  -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
virtual 
DateTime 
?  
FechaExpiracion! 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
} 
public 

class 
ConvenioLookupDto "
:# $
	EntityDto% .
<. /
Guid/ 3
>3 4
{ 
public 
virtual 
string 
Descripcion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 
} ‰	
|D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Convenio\CrearActualizarConvenioDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{ 
public 

class &
CrearActualizarConvenioDto +
{, -
[		 	
Required			 
]		 
[

 	
StringLength

	 
(

 
DomainCommonConsts

 (
.

( ) 
MaxDescriptionLength

) =
)

= >
]

> ?
public 
virtual 
string 
Descripcion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
[ 	
Required	 
] 
public 
virtual 
DateTime 
FechaCreacion  -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
virtual 
DateTime 
?  
FechaExpiracion! 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
} 
} Å
D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Convenio\CrearActualizarExonerationDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{ 
public 

class 
CrearExoneracionDto $
{		 
[ 	
Required	 
] 
public 
Guid 

ServicioId 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
public 
virtual 
decimal 
Valor $
{% &
get' *
;* +
set, /
;/ 0
}1 2
[ 	
Required	 
] 
public 
virtual 
string 
TipoExoneracionId /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
string  
EntidadAuspicianteId *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
string 
PaisId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
? 
EdadInicial 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
? 
	EdadFinal 
{ 
get  #
;# $
set% (
;( )
}* +
public 
bool 
? 
Discapacitado "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
public!! 

class!! $
ActualizarExoneracionDto!! )
{"" 
[$$ 	
Required$$	 
]$$ 
public%% 
virtual%% 
decimal%% 
Valor%% $
{%%% &
get%%' *
;%%* +
set%%, /
;%%/ 0
}%%1 2
['' 	
Required''	 
]'' 
public(( 
virtual(( 
string(( 
TipoExoneracionId(( /
{((0 1
get((2 5
;((5 6
set((7 :
;((: ;
}((< =
public** 
string**  
EntidadAuspicianteId** *
{**+ ,
get**- 0
;**0 1
set**2 5
;**5 6
}**7 8
public,, 
string,, 
PaisId,, 
{,, 
get,, "
;,," #
set,,$ '
;,,' (
},,) *
public.. 
int.. 
?.. 
EdadInicial.. 
{..  !
get.." %
;..% &
set..' *
;..* +
}.., -
public00 
int00 
?00 
	EdadFinal00 
{00 
get00  #
;00# $
set00% (
;00( )
}00* +
public22 
bool22 
?22 
Discapacitado22 "
{22# $
get22% (
;22( )
set22* -
;22- .
}22/ 0
}55 
}77 ¯
wD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Convenio\EntidadAuspicianteDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{		 
public

 

class

 !
EntidadAuspicianteDto

 &
:

' (

IEntityDto

) 3
<

3 4
string

4 :
>

: ;
{ 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxIdLength) 4
)4 5
]5 6
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @
Alfanumericos@ M
)M N
]N O
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxNameLength) 6
)6 7
]7 8
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
} 
public 

class '
EntidadAuspicianteLookupDto ,
:- .
	EntityDto/ 8
<8 9
string9 ?
>? @
{ 
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} µ
pD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Convenio\ExonerationDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{ 
public 

class 
ExonerationDto 
{		 
[ 	
Required	 
] 
public 
Guid 

ConvenioId 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
public 
Guid 

ServicioId 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
public 
string 
Servicio 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
TipoServicio "
{# $
get% (
;( )
set* -
;- .
}/ 0
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
}1 2
public 
string  
EntidadAuspicianteId *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
string 
EntidadAuspiciante (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )#
MaxGeographicalIdLength) @
)@ A
]A B
public 
string 
PaisId 
{ 
get "
;" #
set$ '
;' (
}) *
public!! 
int!! 
?!! 
EdadInicial!! 
{!!  !
get!!" %
;!!% &
set!!' *
;!!* +
}!!, -
public## 
int## 
?## 
	EdadFinal## 
{## 
get##  #
;### $
set##% (
;##( )
}##* +
public%% 
bool%% 
?%% 
Discapacitado%% "
{%%# $
get%%% (
;%%( )
set%%* -
;%%- .
}%%/ 0
['' 	
Required''	 
]'' 
public(( 
virtual(( 
string(( 
TipoExoneracionId(( /
{((0 1
get((2 5
;((5 6
set((7 :
;((: ;
}((< =
public** 
virtual** 
string** 
TipoExoneracion** -
{**. /
get**0 3
;**3 4
set**5 8
;**8 9
}**: ;
},, 
}.. ·
rD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Convenio\GetConvenioInput.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{ 
public 

class 
GetConvenioInput !
:" #*
PagedAndSortedResultRequestDto$ B
{ 
public 
string 
Filter 
{ 
get "
;" #
set$ '
;' (
}) *
} 
}

 £
uD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Convenio\GetExoneracionInput.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{ 
public 

class 
GetExoneracionInput $
:% &*
PagedAndSortedResultRequestDto' E
{ 
private 
string 
SortingDefault %
=& '
$str( 5
;5 6
public		 
GetExoneracionInput		 "
(		" #
)		# $
{

 	
this 
. 
Sorting 
= 
SortingDefault )
;) *
} 	
} 
} ®
uD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Convenio\IConvenioAppService.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{		 
public

 

	interface

 
IConvenioAppService

 (
:

) *
ICrudAppService 
< 
ConvenioDto !
,! "
Guid
 
, 
GetConvenioInput
 
, &
CrearActualizarConvenioDto
 $
>$ %
{ 
Task 
< 
ListResultDto 
< 
ConvenioLookupDto ,
>, -
>- .
GetLookupAsync/ =
(= >
)> ?
;? @
public 
Task 
< 
PagedResultDto "
<" #
ExonerationDto# 1
>1 2
>2 3 
GetExonerationsAsync4 H
(H I
GuidI M
agreementIdN Y
,Y Z
GetExoneracionInput[ n
inputo t
)t u
;u v
public 
Task 
< 
ExonerationDto "
>" #
GetExonerationAsync$ 7
(7 8
Guid8 <
agreementId= H
,H I
GuidJ N
	serviceIdO X
)X Y
;Y Z
public 
Task 
< 
ExonerationDto "
>" #
AddExonerationAsync$ 7
(7 8
Guid8 <
agreementId= H
,H I
CrearExoneracionDtoJ ]
input^ c
)c d
;d e
public 
Task 
< 
ExonerationDto "
>" #"
UpdateExonerationAsync$ :
(: ;
Guid; ?
agreementId@ K
,K L
GuidM Q
	serviceIdR [
,[ \$
ActualizarExoneracionDto] u
inputv {
){ |
;| }
public 
Task "
RemoveExonerationAsync *
(* +
Guid+ /
agreementId0 ;
,; <
Guid= A
	serviceIdB K
)K L
;L M
public 
Task 
< 
ListResultDto !
<! "
ExonerationDto" 0
>0 1
>1 2.
"ObtenerExoneracionPorServicioAsync3 U
(U V
GuidV Z
	serviceId[ d
)d e
;e f
}"" 
}$$ ï
D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Convenio\IEntidadAuspicianteAppService.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{		 
public 

	interface )
IEntidadAuspicianteAppService 2
:3 4
ICrudAppService5 D
<D E!
EntidadAuspicianteDtoE Z
,Z [
string\ b
>b c
{ 
Task 
< 
ListResultDto 
< '
EntidadAuspicianteLookupDto 6
>6 7
>7 8
GetLookupAsync9 G
(G H
)H I
;I J
} 
} â
|D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Convenio\ITipoExoneracionAppService.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{		 
public 

	interface &
ITipoExoneracionAppService /
:0 1
ICrudAppService2 A
<A B
TipoExoneracionDtoB T
,T U
stringV \
>\ ]
{ 
Task 
< 
ListResultDto 
< $
TipoExoneracionLookupDto 3
>3 4
>4 5
GetLookupAsync6 D
(D E
)E F
;F G
} 
} ’
tD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Convenio\TipoExoneracionDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{		 
public

 

class

 
TipoExoneracionDto

 #
:

$ %

IEntityDto

& 0
<

0 1
string

1 7
>

7 8
{ 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxIdLength) 4
)4 5
]5 6
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @
Alfanumericos@ M
)M N
]N O
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxNameLength) 6
)6 7
]7 8
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @,
 AlfanumericosGuionesPuntoEspacio@ `
)` a
]a b
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
} 
public 

class $
TipoExoneracionLookupDto )
:* +
	EntityDto, 5
<5 6
string6 <
>< =
{ 
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} ÿ
èD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\FirmaElectronica\IConfigurarFirmaElectronicaAppService.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
FirmaElectronica& 6
{ 
public		 

	interface		 1
%IConfigurarFirmaElectronicaAppService		 :
{		; <
Task 
< 
bool 
> 
EsPermitidaAsync #
(# $
)$ %
;% &
Task 
< 
bool 
> 
ExisteAsync 
( 
)  
;  !
Task 
< 
bool 
> 
AgregarAsync 
(  
	IFormFile
 
archivoFirma  
,  !
string
 

claveFirma 
) 
; 
Task'' 
<'' 
bool'' 
>'' 
EliminarAsync''  
(''  !
)''! "
;''" #
Task.. 
<.. 
bool.. 
>.. (
EliminarFirmaSignatarioAsync.. /
(../ 0&
EliminarFirmaSignatarioDto..0 J
input..K P
)..P Q
;..Q R
Task55 
<55 )
ConfigurarFirmaElectronicaDto55 *
>55* +
ObtenerAsync55, 8
(558 9+
ConfigurarFirmaElectronicaInput559 X
input55Y ^
)55^ _
;55_ `
}77 
public99 

class99 +
ConfigurarFirmaElectronicaInput99 0
{:: 
[<< 	
Required<<	 
]<< 
public== 
Guid== 
	UsuarioId== 
{== 
get==  #
;==# $
set==% (
;==( )
}==* +
}?? 
publicAA 

classAA )
ConfigurarFirmaElectronicaDtoAA .
{BB 
publicDD 
GuidDD 
	UsuarioIdDD 
{DD 
getDD  #
;DD# $
setDD% (
;DD( )
}DD* +
publicGG 
stringGG 
NombreArchivoGG $
{GG% &
getGG' *
;GG* +
setGG, /
;GG/ 0
}GG1 2
publicII 
stringII 
TipoContenidoII $
{II% &
getII' *
;II* +
setII, /
;II/ 0
}II1 2
publicKK 
byteKK 
[KK 
]KK 
DataKK 
{KK 
getKK !
;KK! "
setKK# &
;KK& '
}KK( )
publicNN 
stringNN 
ClaveNN 
{NN 
getNN "
;NN" #
setNN$ '
;NN' (
}NN) *
}OO 
publicRR 

classRR &
EliminarFirmaSignatarioDtoRR +
{SS 
[TT 	
RequiredTT	 
]TT 
publicUU 
GuidUU "
UnidadAdministrativaIdUU *
{UU+ ,
getUU- 0
;UU0 1
setUU2 5
;UU5 6
}UU7 8
[WW 	
RequiredWW	 
]WW 
publicXX 
GuidXX 
	UsuarioIdXX 
{XX 
getXX  #
;XX# $
setXX% (
;XX( )
}XX* +
[ZZ 	
RequiredZZ	 
]ZZ 
public[[ 
Guid[[ 

ServicioId[[ 
{[[  
get[[! $
;[[$ %
set[[& )
;[[) *
}[[+ ,
}]] 
}^^ ∂
pD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Geographical\CountryDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &

Geografica& 0
{ 
public 

class 

CountryDto 
{ 
public		 
string		 
Code		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
} 
} ﬂ
{D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Geographical\IGeograficaAppService.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &

Geografica& 0
{ 
public		 

	interface		 !
IGeograficaAppService		 *
:		+ ,
IApplicationService		- @
{

 
Task 
< 
ListResultDto 
< 

CountryDto %
>% &
>& '
GetCountriesAsync( 9
(9 :
): ;
;; <
Task 
< 

CountryDto 
> 
GetCountryAsync (
(( )
string) /
countryCode0 ;
); <
;< =
Task 
< 
ListResultDto 
< 
	RegionDto $
>$ %
>% &'
GetRegionByCountryCodeAsync' B
(B C
stringC I
countryCodeJ U
)U V
;V W
} 
} ¥
oD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Geographical\RegionDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &

Geografica& 0
{ 
public 

class 
	RegionDto 
{ 
public		 
string		 
Code		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
} 
} “¬
ìD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Permissions\AdministrativeUnitPermissionDefinitionProvider.cs
	namespace 	
Mre
 
. 
Sb 
. 
AdministrativeUnit #
.# $
Permissions$ /
{ 
public 

class :
.AdministrativeUnitPermissionDefinitionProvider ?
:@ A(
PermissionDefinitionProviderB ^
{		 
public

 
override

 
void

 
Define

 #
(

# $(
IPermissionDefinitionContext

$ @
context

A H
)

H I
{ 	
var 
moduleGroup 
= 
context %
.% &
AddGroup& .
(. /)
AdministrativeUnitPermissions/ L
.L M
	GroupNameM V
,V W
LX Y
(Y Z
$strZ y
)y z
)z {
;{ |
var ,
 administrativeUnitTypePermission 0
=1 2
moduleGroup3 >
.> ?
AddPermission? L
(L M)
AdministrativeUnitPermissionsM j
.j k#
AdministrativeUnitType	k Å
.
Å Ç
Default
Ç â
,
â ä
L
ã å
(
å ç
$str
ç ∫
)
∫ ª
)
ª º
;
º Ω,
 administrativeUnitTypePermission ,
., -
AddChild- 5
(5 6)
AdministrativeUnitPermissions6 S
.S T"
AdministrativeUnitTypeT j
.j k
Createk q
,q r
Ls t
(t u
$str	u à
)
à â
)
â ä
;
ä ã,
 administrativeUnitTypePermission ,
., -
AddChild- 5
(5 6)
AdministrativeUnitPermissions6 S
.S T"
AdministrativeUnitTypeT j
.j k
Updatek q
,q r
Ls t
(t u
$str	u Ü
)
Ü á
)
á à
;
à â,
 administrativeUnitTypePermission ,
., -
AddChild- 5
(5 6)
AdministrativeUnitPermissions6 S
.S T"
AdministrativeUnitTypeT j
.j k
Deletek q
,q r
Ls t
(t u
$str	u à
)
à â
)
â ä
;
ä ã
var !
serviceTypePermission %
=& '
moduleGroup( 3
.3 4
AddPermission4 A
(A B)
AdministrativeUnitPermissionsB _
._ `
ServiceType` k
.k l
Defaultl s
,s t
Lu v
(v w
$str	w ô
)
ô ö
)
ö õ
;
õ ú!
serviceTypePermission !
.! "
AddChild" *
(* +)
AdministrativeUnitPermissions+ H
.H I
ServiceTypeI T
.T U
CreateU [
,[ \
L] ^
(^ _
$str_ r
)r s
)s t
;t u!
serviceTypePermission !
.! "
AddChild" *
(* +)
AdministrativeUnitPermissions+ H
.H I
ServiceTypeI T
.T U
UpdateU [
,[ \
L] ^
(^ _
$str_ p
)p q
)q r
;r s!
serviceTypePermission !
.! "
AddChild" *
(* +)
AdministrativeUnitPermissions+ H
.H I
ServiceTypeI T
.T U
DeleteU [
,[ \
L] ^
(^ _
$str_ r
)r s
)s t
;t u
var  
tariffTypePermission $
=% &
moduleGroup' 2
.2 3
AddPermission3 @
(@ A)
AdministrativeUnitPermissionsA ^
.^ _

TariffType_ i
.i j
Defaultj q
,q r
Ls t
(t u
$str	u ñ
)
ñ ó
)
ó ò
;
ò ô 
tariffTypePermission  
.  !
AddChild! )
() *)
AdministrativeUnitPermissions* G
.G H

TariffTypeH R
.R S
CreateS Y
,Y Z
L[ \
(\ ]
$str] p
)p q
)q r
;r s 
tariffTypePermission  
.  !
AddChild! )
() *)
AdministrativeUnitPermissions* G
.G H

TariffTypeH R
.R S
UpdateS Y
,Y Z
L[ \
(\ ]
$str] n
)n o
)o p
;p q 
tariffTypePermission  
.  !
AddChild! )
() *)
AdministrativeUnitPermissions* G
.G H

TariffTypeH R
.R S
DeleteS Y
,Y Z
L[ \
(\ ]
$str] p
)p q
)q r
;r s
var## 
bankPermission## 
=##  
moduleGroup##! ,
.##, -
AddPermission##- :
(##: ;)
AdministrativeUnitPermissions##; X
.##X Y
Bank##Y ]
.##] ^
Default##^ e
,##e f
L##g h
(##h i
$str	##i Ñ
)
##Ñ Ö
)
##Ö Ü
;
##Ü á
bankPermission$$ 
.$$ 
AddChild$$ #
($$# $)
AdministrativeUnitPermissions$$$ A
.$$A B
Bank$$B F
.$$F G
Create$$G M
,$$M N
L$$O P
($$P Q
$str$$Q d
)$$d e
)$$e f
;$$f g
bankPermission%% 
.%% 
AddChild%% #
(%%# $)
AdministrativeUnitPermissions%%$ A
.%%A B
Bank%%B F
.%%F G
Update%%G M
,%%M N
L%%O P
(%%P Q
$str%%Q b
)%%b c
)%%c d
;%%d e
bankPermission&& 
.&& 
AddChild&& #
(&&# $)
AdministrativeUnitPermissions&&$ A
.&&A B
Bank&&B F
.&&F G
Delete&&G M
,&&M N
L&&O P
(&&P Q
$str&&Q d
)&&d e
)&&e f
;&&f g
var** 
levelPermission** 
=**  !
moduleGroup**" -
.**- .
AddPermission**. ;
(**; <)
AdministrativeUnitPermissions**< Y
.**Y Z
Level**Z _
.**_ `
Default**` g
,**g h
L**i j
(**j k
$str	**k á
)
**á à
)
**à â
;
**â ä
levelPermission++ 
.++ 
AddChild++ $
(++$ %)
AdministrativeUnitPermissions++% B
.++B C
Level++C H
.++H I
Create++I O
,++O P
L++Q R
(++R S
$str++S f
)++f g
)++g h
;++h i
levelPermission,, 
.,, 
AddChild,, $
(,,$ %)
AdministrativeUnitPermissions,,% B
.,,B C
Level,,C H
.,,H I
Update,,I O
,,,O P
L,,Q R
(,,R S
$str,,S d
),,d e
),,e f
;,,f g
levelPermission-- 
.-- 
AddChild-- $
(--$ %)
AdministrativeUnitPermissions--% B
.--B C
Level--C H
.--H I
Delete--I O
,--O P
L--Q R
(--R S
$str--S f
)--f g
)--g h
;--h i
var11 
currencyPermission11 "
=11# $
moduleGroup11% 0
.110 1
AddPermission111 >
(11> ?)
AdministrativeUnitPermissions11? \
.11\ ]
Currency11] e
.11e f
Default11f m
,11m n
L11o p
(11p q
$str	11q ê
)
11ê ë
)
11ë í
;
11í ì
currencyPermission22 
.22 
AddChild22 '
(22' ()
AdministrativeUnitPermissions22( E
.22E F
Currency22F N
.22N O
Create22O U
,22U V
L22W X
(22X Y
$str22Y l
)22l m
)22m n
;22n o
currencyPermission33 
.33 
AddChild33 '
(33' ()
AdministrativeUnitPermissions33( E
.33E F
Currency33F N
.33N O
Update33O U
,33U V
L33W X
(33X Y
$str33Y j
)33j k
)33k l
;33l m
currencyPermission44 
.44 
AddChild44 '
(44' ()
AdministrativeUnitPermissions44( E
.44E F
Currency44F N
.44N O
Delete44O U
,44U V
L44W X
(44X Y
$str44Y l
)44l m
)44m n
;44n o
var88 !
paymentTypePermission88 %
=88& '
moduleGroup88( 3
.883 4
AddPermission884 A
(88A B)
AdministrativeUnitPermissions88B _
.88_ `
PaymentType88` k
.88k l
Default88l s
,88s t
L88u v
(88v w
$str	88w ô
)
88ô ö
)
88ö õ
;
88õ ú!
paymentTypePermission99 !
.99! "
AddChild99" *
(99* +)
AdministrativeUnitPermissions99+ H
.99H I
PaymentType99I T
.99T U
Create99U [
,99[ \
L99] ^
(99^ _
$str99_ r
)99r s
)99s t
;99t u!
paymentTypePermission:: !
.::! "
AddChild::" *
(::* +)
AdministrativeUnitPermissions::+ H
.::H I
PaymentType::I T
.::T U
Update::U [
,::[ \
L::] ^
(::^ _
$str::_ p
)::p q
)::q r
;::r s!
paymentTypePermission;; !
.;;! "
AddChild;;" *
(;;* +)
AdministrativeUnitPermissions;;+ H
.;;H I
PaymentType;;I T
.;;T U
Delete;;U [
,;;[ \
L;;] ^
(;;^ _
$str;;_ r
);;r s
);;s t
;;;t u
var@@ 
positionPermission@@ "
=@@# $
moduleGroup@@% 0
.@@0 1
AddPermission@@1 >
(@@> ?)
AdministrativeUnitPermissions@@? \
.@@\ ]
Position@@] e
.@@e f
Default@@f m
,@@m n
L@@o p
(@@p q
$str	@@q ê
)
@@ê ë
)
@@ë í
;
@@í ì
positionPermissionAA 
.AA 
AddChildAA '
(AA' ()
AdministrativeUnitPermissionsAA( E
.AAE F
PositionAAF N
.AAN O
CreateAAO U
,AAU V
LAAW X
(AAX Y
$strAAY l
)AAl m
)AAm n
;AAn o
positionPermissionBB 
.BB 
AddChildBB '
(BB' ()
AdministrativeUnitPermissionsBB( E
.BBE F
PositionBBF N
.BBN O
UpdateBBO U
,BBU V
LBBW X
(BBX Y
$strBBY j
)BBj k
)BBk l
;BBl m
positionPermissionCC 
.CC 
AddChildCC '
(CC' ()
AdministrativeUnitPermissionsCC( E
.CCE F
PositionCCF N
.CCN O
DeleteCCO U
,CCU V
LCCW X
(CCX Y
$strCCY l
)CCl m
)CCm n
;CCn o
varGG 
bookPermissionGG 
=GG  
moduleGroupGG! ,
.GG, -
AddPermissionGG- :
(GG: ;)
AdministrativeUnitPermissionsGG; X
.GGX Y
BookGGY ]
.GG] ^
DefaultGG^ e
,GGe f
LGGg h
(GGh i
$str	GGi Ñ
)
GGÑ Ö
)
GGÖ Ü
;
GGÜ á
bookPermissionHH 
.HH 
AddChildHH #
(HH# $)
AdministrativeUnitPermissionsHH$ A
.HHA B
BookHHB F
.HHF G
CreateHHG M
,HHM N
LHHO P
(HHP Q
$strHHQ d
)HHd e
)HHe f
;HHf g
bookPermissionII 
.II 
AddChildII #
(II# $)
AdministrativeUnitPermissionsII$ A
.IIA B
BookIIB F
.IIF G
UpdateIIG M
,IIM N
LIIO P
(IIP Q
$strIIQ b
)IIb c
)IIc d
;IId e
bookPermissionJJ 
.JJ 
AddChildJJ #
(JJ# $)
AdministrativeUnitPermissionsJJ$ A
.JJA B
BookJJB F
.JJF G
DeleteJJG M
,JJM N
LJJO P
(JJP Q
$strJJQ d
)JJd e
)JJe f
;JJf g
varNN (
administrativeUnitPermissionNN ,
=NN- .
moduleGroupNN/ :
.NN: ;
AddPermissionNN; H
(NNH I)
AdministrativeUnitPermissionsNNI f
.NNf g
AdministrativeUnitNNg y
.NNy z
Default	NNz Å
,
NNÅ Ç
L
NNÉ Ñ
(
NNÑ Ö
$str
NNÖ Æ
)
NNÆ Ø
)
NNØ ∞
;
NN∞ ±(
administrativeUnitPermissionOO (
.OO( )
AddChildOO) 1
(OO1 2)
AdministrativeUnitPermissionsOO2 O
.OOO P
AdministrativeUnitOOP b
.OOb c
CreateOOc i
,OOi j
LOOk l
(OOl m
$str	OOm Ä
)
OOÄ Å
)
OOÅ Ç
;
OOÇ É(
administrativeUnitPermissionPP (
.PP( )
AddChildPP) 1
(PP1 2)
AdministrativeUnitPermissionsPP2 O
.PPO P
AdministrativeUnitPPP b
.PPb c
UpdatePPc i
,PPi j
LPPk l
(PPl m
$strPPm ~
)PP~ 
)	PP Ä
;
PPÄ Å(
administrativeUnitPermissionQQ (
.QQ( )
AddChildQQ) 1
(QQ1 2)
AdministrativeUnitPermissionsQQ2 O
.QQO P
AdministrativeUnitQQP b
.QQb c
DeleteQQc i
,QQi j
LQQk l
(QQl m
$str	QQm Ä
)
QQÄ Å
)
QQÅ Ç
;
QQÇ É
varUU $
agentAttentionPermissionUU (
=UU) *
moduleGroupUU+ 6
.UU6 7
AddPermissionUU7 D
(UUD E)
AdministrativeUnitPermissionsUUE b
.UUb c
AgentAttentionUUc q
.UUq r
DefaultUUr y
,UUy z
LUU{ |
(UU| }
$str	UU} ¢
)
UU¢ £
)
UU£ §
;
UU§ •$
agentAttentionPermissionVV $
.VV$ %
AddChildVV% -
(VV- .)
AdministrativeUnitPermissionsVV. K
.VVK L
AgentAttentionVVL Z
.VVZ [
CreateVV[ a
,VVa b
LVVc d
(VVd e
$strVVe x
)VVx y
)VVy z
;VVz {$
agentAttentionPermissionWW $
.WW$ %
AddChildWW% -
(WW- .)
AdministrativeUnitPermissionsWW. K
.WWK L
AgentAttentionWWL Z
.WWZ [
UpdateWW[ a
,WWa b
LWWc d
(WWd e
$strWWe v
)WWv w
)WWw x
;WWx y$
agentAttentionPermissionXX $
.XX$ %
AddChildXX% -
(XX- .)
AdministrativeUnitPermissionsXX. K
.XXK L
AgentAttentionXXL Z
.XXZ [
DeleteXX[ a
,XXa b
LXXc d
(XXd e
$strXXe x
)XXx y
)XXy z
;XXz {
var\\ 
servicePermission\\ !
=\\" #
moduleGroup\\$ /
.\\/ 0
AddPermission\\0 =
(\\= >)
AdministrativeUnitPermissions\\> [
.\\[ \
Service\\\ c
.\\c d
Default\\d k
,\\k l
L\\m n
(\\n o
$str	\\o ç
)
\\ç é
)
\\é è
;
\\è ê
servicePermission]] 
.]] 
AddChild]] &
(]]& ')
AdministrativeUnitPermissions]]' D
.]]D E
Service]]E L
.]]L M
Create]]M S
,]]S T
L]]U V
(]]V W
$str]]W j
)]]j k
)]]k l
;]]l m
servicePermission^^ 
.^^ 
AddChild^^ &
(^^& ')
AdministrativeUnitPermissions^^' D
.^^D E
Service^^E L
.^^L M
Update^^M S
,^^S T
L^^U V
(^^V W
$str^^W h
)^^h i
)^^i j
;^^j k
servicePermission__ 
.__ 
AddChild__ &
(__& ')
AdministrativeUnitPermissions__' D
.__D E
Service__E L
.__L M
Delete__M S
,__S T
L__U V
(__V W
$str__W j
)__j k
)__k l
;__l m
varbb 
tariffPermissionbb  
=bb! "
moduleGroupbb# .
.bb. /
AddPermissionbb/ <
(bb< =)
AdministrativeUnitPermissionsbb= Z
.bbZ [
Tariffbb[ a
.bba b
Defaultbbb i
,bbi j
Lbbk l
(bbl m
$str	bbm ä
)
bbä ã
)
bbã å
;
bbå ç
tariffPermissioncc 
.cc 
AddChildcc %
(cc% &)
AdministrativeUnitPermissionscc& C
.ccC D
TariffccD J
.ccJ K
CreateccK Q
,ccQ R
LccS T
(ccT U
$strccU h
)cch i
)cci j
;ccj k
tariffPermissiondd 
.dd 
AddChilddd %
(dd% &)
AdministrativeUnitPermissionsdd& C
.ddC D
TariffddD J
.ddJ K
UpdateddK Q
,ddQ R
LddS T
(ddT U
$strddU f
)ddf g
)ddg h
;ddh i
tariffPermissionee 
.ee 
AddChildee %
(ee% &)
AdministrativeUnitPermissionsee& C
.eeC D
TariffeeD J
.eeJ K
DeleteeeK Q
,eeQ R
LeeS T
(eeT U
$streeU h
)eeh i
)eei j
;eej k
varii %
tariffHierarchyPermissionii )
=ii* +
moduleGroupii, 7
.ii7 8
AddPermissionii8 E
(iiE F)
AdministrativeUnitPermissionsiiF c
.iic d
TariffHierarchyiid s
.iis t
Defaultiit {
,ii{ |
Lii} ~
(ii~ 
$str	ii •
)
ii• ¶
)
ii¶ ß
;
iiß ®%
tariffHierarchyPermissionjj %
.jj% &
AddChildjj& .
(jj. /)
AdministrativeUnitPermissionsjj/ L
.jjL M
TariffHierarchyjjM \
.jj\ ]
Createjj] c
,jjc d
Ljje f
(jjf g
$strjjg z
)jjz {
)jj{ |
;jj| }%
tariffHierarchyPermissionkk %
.kk% &
AddChildkk& .
(kk. /)
AdministrativeUnitPermissionskk/ L
.kkL M
TariffHierarchykkM \
.kk\ ]
Updatekk] c
,kkc d
Lkke f
(kkf g
$strkkg x
)kkx y
)kky z
;kkz {%
tariffHierarchyPermissionll %
.ll% &
AddChildll& .
(ll. /)
AdministrativeUnitPermissionsll/ L
.llL M
TariffHierarchyllM \
.ll\ ]
Deletell] c
,llc d
Llle f
(llf g
$strllg z
)llz {
)ll{ |
;ll| }
varpp #
tariffHeadingPermissionpp '
=pp( )
moduleGrouppp* 5
.pp5 6
AddPermissionpp6 C
(ppC D)
AdministrativeUnitPermissionsppD a
.ppa b
TariffHeadingppb o
.ppo p
Defaultppp w
,ppw x
Lppy z
(ppz {
$str	pp{ ü
)
ppü †
)
pp† °
;
pp° ¢#
tariffHeadingPermissionqq #
.qq# $
AddChildqq$ ,
(qq, -)
AdministrativeUnitPermissionsqq- J
.qqJ K
TariffHeadingqqK X
.qqX Y
CreateqqY _
,qq_ `
Lqqa b
(qqb c
$strqqc v
)qqv w
)qqw x
;qqx y#
tariffHeadingPermissionrr #
.rr# $
AddChildrr$ ,
(rr, -)
AdministrativeUnitPermissionsrr- J
.rrJ K
TariffHeadingrrK X
.rrX Y
UpdaterrY _
,rr_ `
Lrra b
(rrb c
$strrrc t
)rrt u
)rru v
;rrv w#
tariffHeadingPermissionss #
.ss# $
AddChildss$ ,
(ss, -)
AdministrativeUnitPermissionsss- J
.ssJ K
TariffHeadingssK X
.ssX Y
DeletessY _
,ss_ `
Lssa b
(ssb c
$strssc v
)ssv w
)ssw x
;ssx y
varww 
agreementPermissionww #
=ww$ %
moduleGroupww& 1
.ww1 2
AddPermissionww2 ?
(ww? @)
AdministrativeUnitPermissionsww@ ]
.ww] ^
	Agreementww^ g
.wwg h
Defaultwwh o
,wwo p
Lwwq r
(wwr s
$str	wws ì
)
wwì î
)
wwî ï
;
wwï ñ
agreementPermissionxx 
.xx  
AddChildxx  (
(xx( ))
AdministrativeUnitPermissionsxx) F
.xxF G
	AgreementxxG P
.xxP Q
CreatexxQ W
,xxW X
LxxY Z
(xxZ [
$strxx[ n
)xxn o
)xxo p
;xxp q
agreementPermissionyy 
.yy  
AddChildyy  (
(yy( ))
AdministrativeUnitPermissionsyy) F
.yyF G
	AgreementyyG P
.yyP Q
UpdateyyQ W
,yyW X
LyyY Z
(yyZ [
$stryy[ l
)yyl m
)yym n
;yyn o
agreementPermissionzz 
.zz  
AddChildzz  (
(zz( ))
AdministrativeUnitPermissionszz) F
.zzF G
	AgreementzzG P
.zzP Q
DeletezzQ W
,zzW X
LzzY Z
(zzZ [
$strzz[ n
)zzn o
)zzo p
;zzp q
var~~ -
!signatarioConfiguracionPermission~~ 1
=~~2 3
moduleGroup~~4 ?
.~~? @
AddPermission~~@ M
(~~M N)
AdministrativeUnitPermissions~~N k
.~~k l$
SignatarioConfiguracion	~~l É
.
~~É Ñ
Default
~~Ñ ã
,
~~ã å
L
~~ç é
(
~~é è
$str
~~è ≥
)
~~≥ ¥
)
~~¥ µ
;
~~µ ∂-
!signatarioConfiguracionPermission -
.- .
AddChild. 6
(6 7)
AdministrativeUnitPermissions7 T
.T U#
SignatarioConfiguracionU l
.l m
Deletem s
,s t
Lu v
(v w
$str	w ä
)
ä ã
)
ã å
;
å ç
var
ÑÑ *
tipoCuentaBancariaPermission
ÑÑ ,
=
ÑÑ- .
moduleGroup
ÑÑ/ :
.
ÑÑ: ;
AddPermission
ÑÑ; H
(
ÑÑH I+
AdministrativeUnitPermissions
ÑÑI f
.
ÑÑf g 
TipoCuentaBancaria
ÑÑg y
.
ÑÑy z
DefaultÑÑz Å
,ÑÑÅ Ç
LÑÑÉ Ñ
(ÑÑÑ Ö
$strÑÑÖ Æ
)ÑÑÆ Ø
)ÑÑØ ∞
;ÑÑ∞ ±*
tipoCuentaBancariaPermission
ÖÖ (
.
ÖÖ( )
AddChild
ÖÖ) 1
(
ÖÖ1 2+
AdministrativeUnitPermissions
ÖÖ2 O
.
ÖÖO P 
TipoCuentaBancaria
ÖÖP b
.
ÖÖb c
Create
ÖÖc i
,
ÖÖi j
L
ÖÖk l
(
ÖÖl m
$strÖÖm Ä
)ÖÖÄ Å
)ÖÖÅ Ç
;ÖÖÇ É*
tipoCuentaBancariaPermission
ÜÜ (
.
ÜÜ( )
AddChild
ÜÜ) 1
(
ÜÜ1 2+
AdministrativeUnitPermissions
ÜÜ2 O
.
ÜÜO P 
TipoCuentaBancaria
ÜÜP b
.
ÜÜb c
Update
ÜÜc i
,
ÜÜi j
L
ÜÜk l
(
ÜÜl m
$str
ÜÜm ~
)
ÜÜ~ 
)ÜÜ Ä
;ÜÜÄ Å*
tipoCuentaBancariaPermission
áá (
.
áá( )
AddChild
áá) 1
(
áá1 2+
AdministrativeUnitPermissions
áá2 O
.
ááO P 
TipoCuentaBancaria
ááP b
.
ááb c
Delete
áác i
,
áái j
L
áák l
(
áál m
$stráám Ä
)ááÄ Å
)ááÅ Ç
;ááÇ É
}
ãã 	
private
çç 
static
çç 
LocalizableString
çç (
L
çç) *
(
çç* +
string
çç+ 1
name
çç2 6
)
çç6 7
{
éé 	
return
èè 
LocalizableString
èè $
.
èè$ %
Create
èè% +
<
èè+ ,(
AdministrativeUnitResource
èè, F
>
èèF G
(
èèG H
name
èèH L
)
èèL M
;
èèM N
}
êê 	
}
ëë 
}íí áu
ÇD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Permissions\AdministrativeUnitPermissions.cs
	namespace 	
Mre
 
. 
Sb 
. 
AdministrativeUnit #
.# $
Permissions$ /
{ 
public 

static 
class )
AdministrativeUnitPermissions 5
{ 
public 
const 
string 
	GroupName %
=& '
$str( <
;< =
public

 
static

 
class

 "
AdministrativeUnitType

 2
{ 	
public 
const 
string 
Default  '
=( )
	GroupName* 3
+4 5
$str6 O
;O P
public 
const 
string 
Create  &
=' (
Default) 0
+1 2
$str3 <
;< =
public 
const 
string 
Update  &
=' (
Default) 0
+1 2
$str3 <
;< =
public 
const 
string 
Delete  &
=' (
Default) 0
+1 2
$str3 <
;< =
} 	
public 
static 
class 
ServiceType '
{ 	
public 
const 
string 
Default  '
=( )
	GroupName* 3
+4 5
$str6 D
;D E
public 
const 
string 
Create  &
=' (
Default) 0
+1 2
$str3 <
;< =
public 
const 
string 
Update  &
=' (
Default) 0
+1 2
$str3 <
;< =
public 
const 
string 
Delete  &
=' (
Default) 0
+1 2
$str3 <
;< =
} 	
public 
static 
class 

TariffType &
{ 	
public 
const 
string 
Default  '
=( )
	GroupName* 3
+4 5
$str6 C
;C D
public   
const   
string   
Create    &
=  ' (
Default  ) 0
+  1 2
$str  3 <
;  < =
public!! 
const!! 
string!! 
Update!!  &
=!!' (
Default!!) 0
+!!1 2
$str!!3 <
;!!< =
public"" 
const"" 
string"" 
Delete""  &
=""' (
Default"") 0
+""1 2
$str""3 <
;""< =
}## 	
public'' 
static'' 
class'' 
Bank''  
{(( 	
public)) 
const)) 
string)) 
Default))  '
=))( )
	GroupName))* 3
+))4 5
$str))6 =
;))= >
public** 
const** 
string** 
Create**  &
=**' (
Default**) 0
+**1 2
$str**3 <
;**< =
public++ 
const++ 
string++ 
Update++  &
=++' (
Default++) 0
+++1 2
$str++3 <
;++< =
public,, 
const,, 
string,, 
Delete,,  &
=,,' (
Default,,) 0
+,,1 2
$str,,3 <
;,,< =
}-- 	
public00 
static00 
class00 
Level00 !
{11 	
public22 
const22 
string22 
Default22  '
=22( )
	GroupName22* 3
+224 5
$str226 >
;22> ?
public33 
const33 
string33 
Create33  &
=33' (
Default33) 0
+331 2
$str333 <
;33< =
public44 
const44 
string44 
Update44  &
=44' (
Default44) 0
+441 2
$str443 <
;44< =
public55 
const55 
string55 
Delete55  &
=55' (
Default55) 0
+551 2
$str553 <
;55< =
}66 	
public99 
static99 
class99 
Currency99 $
{:: 	
public;; 
const;; 
string;; 
Default;;  '
=;;( )
	GroupName;;* 3
+;;4 5
$str;;6 A
;;;A B
public<< 
const<< 
string<< 
Create<<  &
=<<' (
Default<<) 0
+<<1 2
$str<<3 <
;<<< =
public== 
const== 
string== 
Update==  &
===' (
Default==) 0
+==1 2
$str==3 <
;==< =
public>> 
const>> 
string>> 
Delete>>  &
=>>' (
Default>>) 0
+>>1 2
$str>>3 <
;>>< =
}?? 	
publicCC 
staticCC 
classCC 
PaymentTypeCC '
{DD 	
publicEE 
constEE 
stringEE 
DefaultEE  '
=EE( )
	GroupNameEE* 3
+EE4 5
$strEE6 D
;EED E
publicFF 
constFF 
stringFF 
CreateFF  &
=FF' (
DefaultFF) 0
+FF1 2
$strFF3 <
;FF< =
publicGG 
constGG 
stringGG 
UpdateGG  &
=GG' (
DefaultGG) 0
+GG1 2
$strGG3 <
;GG< =
publicHH 
constHH 
stringHH 
DeleteHH  &
=HH' (
DefaultHH) 0
+HH1 2
$strHH3 <
;HH< =
}II 	
publicLL 
staticLL 
classLL 
PositionLL $
{MM 	
publicNN 
constNN 
stringNN 
DefaultNN  '
=NN( )
	GroupNameNN* 3
+NN4 5
$strNN6 A
;NNA B
publicOO 
constOO 
stringOO 
CreateOO  &
=OO' (
DefaultOO) 0
+OO1 2
$strOO3 <
;OO< =
publicPP 
constPP 
stringPP 
UpdatePP  &
=PP' (
DefaultPP) 0
+PP1 2
$strPP3 <
;PP< =
publicQQ 
constQQ 
stringQQ 
DeleteQQ  &
=QQ' (
DefaultQQ) 0
+QQ1 2
$strQQ3 <
;QQ< =
}RR 	
publicVV 
staticVV 
classVV 
AdministrativeUnitVV .
{WW 	
publicXX 
constXX 
stringXX 
DefaultXX  '
=XX( )
	GroupNameXX* 3
+XX4 5
$strXX6 K
;XXK L
publicYY 
constYY 
stringYY 
CreateYY  &
=YY' (
DefaultYY) 0
+YY1 2
$strYY3 <
;YY< =
publicZZ 
constZZ 
stringZZ 
UpdateZZ  &
=ZZ' (
DefaultZZ) 0
+ZZ1 2
$strZZ3 <
;ZZ< =
public[[ 
const[[ 
string[[ 
Delete[[  &
=[[' (
Default[[) 0
+[[1 2
$str[[3 <
;[[< =
}\\ 	
public^^ 
static^^ 
class^^ #
SignatarioConfiguracion^^ 3
{__ 	
public`` 
const`` 
string`` 
Default``  '
=``( )
	GroupName``* 3
+``4 5
$str``6 P
;``P Q
publicaa 
constaa 
stringaa 
Deleteaa  &
=aa' (
Defaultaa) 0
+aa1 2
$straa3 <
;aa< =
}bb 	
publicee 
staticee 
classee 
Serviceee #
{ff 	
publicgg 
constgg 
stringgg 
Defaultgg  '
=gg( )
	GroupNamegg* 3
+gg4 5
$strgg6 @
;gg@ A
publichh 
consthh 
stringhh 
Createhh  &
=hh' (
Defaulthh) 0
+hh1 2
$strhh3 <
;hh< =
publicii 
constii 
stringii 
Updateii  &
=ii' (
Defaultii) 0
+ii1 2
$strii3 <
;ii< =
publicjj 
constjj 
stringjj 
Deletejj  &
=jj' (
Defaultjj) 0
+jj1 2
$strjj3 <
;jj< =
}kk 	
publicnn 
staticnn 
classnn 
AgentAttentionnn *
{oo 	
publicpp 
constpp 
stringpp 
Defaultpp  '
=pp( )
	GroupNamepp* 3
+pp4 5
$strpp6 G
;ppG H
publicqq 
constqq 
stringqq 
Createqq  &
=qq' (
Defaultqq) 0
+qq1 2
$strqq3 <
;qq< =
publicrr 
constrr 
stringrr 
Updaterr  &
=rr' (
Defaultrr) 0
+rr1 2
$strrr3 <
;rr< =
publicss 
constss 
stringss 
Deletess  &
=ss' (
Defaultss) 0
+ss1 2
$strss3 <
;ss< =
}tt 	
publicww 
staticww 
classww 
Bookww  
{xx 	
publicyy 
constyy 
stringyy 
Defaultyy  '
=yy( )
	GroupNameyy* 3
+yy4 5
$stryy6 =
;yy= >
publiczz 
constzz 
stringzz 
Createzz  &
=zz' (
Defaultzz) 0
+zz1 2
$strzz3 <
;zz< =
public{{ 
const{{ 
string{{ 
Update{{  &
={{' (
Default{{) 0
+{{1 2
$str{{3 <
;{{< =
public|| 
const|| 
string|| 
Delete||  &
=||' (
Default||) 0
+||1 2
$str||3 <
;||< =
}}} 	
public
ÄÄ 
static
ÄÄ 
class
ÄÄ 
Tariff
ÄÄ "
{
ÅÅ 	
public
ÇÇ 
const
ÇÇ 
string
ÇÇ 
Default
ÇÇ  '
=
ÇÇ( )
	GroupName
ÇÇ* 3
+
ÇÇ4 5
$str
ÇÇ6 ?
;
ÇÇ? @
public
ÉÉ 
const
ÉÉ 
string
ÉÉ 
Create
ÉÉ  &
=
ÉÉ' (
Default
ÉÉ) 0
+
ÉÉ1 2
$str
ÉÉ3 <
;
ÉÉ< =
public
ÑÑ 
const
ÑÑ 
string
ÑÑ 
Update
ÑÑ  &
=
ÑÑ' (
Default
ÑÑ) 0
+
ÑÑ1 2
$str
ÑÑ3 <
;
ÑÑ< =
public
ÖÖ 
const
ÖÖ 
string
ÖÖ 
Delete
ÖÖ  &
=
ÖÖ' (
Default
ÖÖ) 0
+
ÖÖ1 2
$str
ÖÖ3 <
;
ÖÖ< =
}
ÜÜ 	
public
ââ 
static
ââ 
class
ââ 
TariffHierarchy
ââ +
{
ää 	
public
ãã 
const
ãã 
string
ãã 
Default
ãã  '
=
ãã( )
	GroupName
ãã* 3
+
ãã4 5
$str
ãã6 H
;
ããH I
public
åå 
const
åå 
string
åå 
Create
åå  &
=
åå' (
Default
åå) 0
+
åå1 2
$str
åå3 <
;
åå< =
public
çç 
const
çç 
string
çç 
Update
çç  &
=
çç' (
Default
çç) 0
+
çç1 2
$str
çç3 <
;
çç< =
public
éé 
const
éé 
string
éé 
Delete
éé  &
=
éé' (
Default
éé) 0
+
éé1 2
$str
éé3 <
;
éé< =
}
èè 	
public
íí 
static
íí 
class
íí 
TariffHeading
íí )
{
ìì 	
public
îî 
const
îî 
string
îî 
Default
îî  '
=
îî( )
	GroupName
îî* 3
+
îî4 5
$str
îî6 F
;
îîF G
public
ïï 
const
ïï 
string
ïï 
Create
ïï  &
=
ïï' (
Default
ïï) 0
+
ïï1 2
$str
ïï3 <
;
ïï< =
public
ññ 
const
ññ 
string
ññ 
Update
ññ  &
=
ññ' (
Default
ññ) 0
+
ññ1 2
$str
ññ3 <
;
ññ< =
public
óó 
const
óó 
string
óó 
Delete
óó  &
=
óó' (
Default
óó) 0
+
óó1 2
$str
óó3 <
;
óó< =
}
òò 	
public
õõ 
static
õõ 
class
õõ 
	Agreement
õõ %
{
úú 	
public
ùù 
const
ùù 
string
ùù 
Default
ùù  '
=
ùù( )
	GroupName
ùù* 3
+
ùù4 5
$str
ùù6 B
;
ùùB C
public
ûû 
const
ûû 
string
ûû 
Create
ûû  &
=
ûû' (
Default
ûû) 0
+
ûû1 2
$str
ûû3 <
;
ûû< =
public
üü 
const
üü 
string
üü 
Update
üü  &
=
üü' (
Default
üü) 0
+
üü1 2
$str
üü3 <
;
üü< =
public
†† 
const
†† 
string
†† 
Delete
††  &
=
††' (
Default
††) 0
+
††1 2
$str
††3 <
;
††< =
}
°° 	
public
§§ 
static
§§ 
class
§§  
TipoCuentaBancaria
§§ .
{
•• 	
public
¶¶ 
const
¶¶ 
string
¶¶ 
Default
¶¶  '
=
¶¶( )
	GroupName
¶¶* 3
+
¶¶4 5
$str
¶¶6 K
;
¶¶K L
public
ßß 
const
ßß 
string
ßß 
Create
ßß  &
=
ßß' (
Default
ßß) 0
+
ßß1 2
$str
ßß3 <
;
ßß< =
public
®® 
const
®® 
string
®® 
Update
®®  &
=
®®' (
Default
®®) 0
+
®®1 2
$str
®®3 <
;
®®< =
public
©© 
const
©© 
string
©© 
Delete
©©  &
=
©©' (
Default
©©) 0
+
©©1 2
$str
©©3 <
;
©©< =
}
™™ 	
public
≠≠ 
static
≠≠ 
string
≠≠ 
[
≠≠ 
]
≠≠ 
GetAll
≠≠ %
(
≠≠% &
)
≠≠& '
{
ÆÆ 	
return
ØØ 
ReflectionHelper
ØØ #
.
ØØ# $+
GetPublicConstantsRecursively
ØØ$ A
(
ØØA B
typeof
ØØB H
(
ØØH I+
AdministrativeUnitPermissions
ØØI f
)
ØØf g
)
ØØg h
;
ØØh i
}
∞∞ 	
}
±± 
}≤≤ ∑
jD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Servicio\CargoDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{ 
public 

class 
CargoDto 
: 

IEntityDto &
<& '
string' -
>- .
{ 
[		 	
Required			 
]		 
[

 	
StringLength

	 
(

 
DomainCommonConsts

 (
.

( )
MaxIdLength

) 4
)

4 5
]

5 6
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @
Alfanumericos@ M
)M N
]N O
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxNameLength) 6
)6 7
]7 8
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @,
 AlfanumericosGuionesPuntoEspacio@ `
)` a
]a b
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
} 
public 

class 
CargoLookupDto 
:  !
	EntityDto" +
<+ ,
string, 2
>2 3
{ 
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} å
ÉD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Servicio\CrearActualizarSecuencialLibroDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{ 
public 

class -
!CrearActualizarSecuencialLibroDto 2
{		 
[

 	
Required

	 
]

 
public 
Guid 

ServicioId 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
public 
Guid "
UnidadAdministrativaId *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
[ 	
Required	 
] 
public 
string 
LibroId 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Required	 
] 
public 
int "
NumeroPaginaPorVolumen )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
[ 	
Required	 
] 
public 
int 
VolumenActual  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
int 
SiguientePagina "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 
Anio 
{ 
get 
; 
set "
;" #
}$ %
} 
} ù
|D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Servicio\CrearActualizarServicioDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{ 
public 

class &
CrearActualizarServicioDto +
{, -
[ 	
Required	 
] 
[		 	
StringLength			 
(		 
DomainCommonConsts		 (
.		( )
MaxNameLength		) 6
)		6 7
]		7 8
public

 
string

 
Nombre

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
public 
bool 
AtencionPresencial &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
bool "
AtencionSemiPresencial *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
bool 
AtencionVirtual #
{$ %
get& )
;) *
set+ .
;. /
}0 1
[ 	
Required	 
] 
public 
string 
TipoServicioId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
[ 	
Required	 
] 
public 
bool 
Activo 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ·
rD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Servicio\GetServicioInput.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{ 
public 

class 
GetServicioInput !
:" #*
PagedAndSortedResultRequestDto$ B
{ 
public 
string 
Filter 
{ 
get "
;" #
set$ '
;' (
}) *
} 
}

 ·
rD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Servicio\ICargoAppService.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{ 
public 

	interface 
ICargoAppService %
:& '
ICrudAppService( 7
<7 8
CargoDto8 @
,@ A
stringB H
>H I
{ 
Task		 
<		 
ListResultDto		 
<		 
CargoLookupDto		 )
>		) *
>		* +
GetLookupAsync		, :
(		: ;
)		; <
;		< =
}

 
} ò
|D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Servicio\ISecuencialLibroAppService.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{ 
public 

	interface &
ISecuencialLibroAppService /
:0 1
ICrudAppService2 A
<A B
SecuencialLibroDtoB T
,T U
GuidV Z
,Z [*
PagedAndSortedResultRequestDto\ z
,z {.
!CrearActualizarSecuencialLibroDto	| ù
>
ù û
{		 
public

 
Task

 
<

 
PagedResultDto

 "
<

" #
SecuencialLibroDto

# 5
>

5 6
>

6 7/
#GetByAdministrativeUnitServiceAsync

8 [
(

[ \
Guid

\ `
	serviceId

a j
,

j k
Guid

l p!
administrativeUnitId	

q Ö
)


Ö Ü
;


Ü á
} 
} Ä
uD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Servicio\IServicioAppService.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{ 
public 

	interface 
IServicioAppService (
:) *
ICrudAppService		 
<		 
ServicioDto		 !
,		! "
Guid


 
,

 
GetServicioInput
 
, &
CrearActualizarServicioDto
 $
>$ %
{ 
Task 
< 
ListResultDto 
< 
ServicioDto &
>& '
>' (
GetLookupAsync) 7
(7 8
bool8 <
?< =
isActive> F
)F G
;G H
} 
} Á
uD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Servicio\ITipoPagoAppService.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{		 
public 

	interface 
ITipoPagoAppService (
:) *
ICrudAppService+ :
<: ;
TipoPagoDto; F
,F G
stringH N
>N O
{ 
Task 
< 
ListResultDto 
< 
TipoPagoDto &
>& '
>' (
GetLookupAsync) 7
(7 8
)8 9
;9 :
} 
} ˝
yD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Servicio\ITipoServicioAppService.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{ 
public		 

	interface		 #
ITipoServicioAppService		 ,
:		- .
ICrudAppService		/ >
<		> ?
TipoServicioDto		? N
,		N O
string		P V
>		V W
{

 
Task 
< 
ListResultDto 
< !
TipoServicioLookupDto 0
>0 1
>1 2
GetLookupAsync3 A
(A B
)B C
;C D
} 
} ≥
jD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Servicio\LibroDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{ 
public 

class 
LibroDto 
: 

IEntityDto &
<& '
string' -
>- .
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
( 

BookConsts  
.  !
MaxBookIdLength! 0
)0 1
]1 2
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
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxNameLength) 6
)6 7
]7 8
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @,
 AlfanumericosGuionesPuntoEspacio@ `
)` a
]a b
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
} 
public 

class 
LibroLookupDto 
:  !
	EntityDto" +
<+ ,
string, 2
>2 3
{ 
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} Ì
tD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Servicio\SecuencialLibroDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{ 
public 

class 
SecuencialLibroDto #
:$ %

IEntityDto& 0
<0 1
Guid1 5
>5 6
{		 
public

 
Guid

 
Id

 
{

 
get

 
;

 
set

 !
;

! "
}

# $
public 
Guid 

ServicioId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
Guid "
UnidadAdministrativaId *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
string 
LibroId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Libro 
{ 
get !
;! "
set# &
;& '
}( )
public 
int "
NumeroPaginaPorVolumen )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
int 
VolumenActual  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
int 
SiguientePagina "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 
Anio 
{ 
get 
; 
set "
;" #
}$ %
} 
} Œ
mD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Servicio\ServicioDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{ 
public		 

class		 
ServicioDto		 
:		 

IEntityDto		 )
<		) *
Guid		* .
>		. /
{

 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 
Nombre 
{ 
get "
;" #
set% (
;( )
}* +
public 
string 
TipoServicioId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
TipoServicio "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
bool 
AtencionPresencial &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
bool "
AtencionSemiPresencial *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
bool 
AtencionVirtual #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
bool 
Activo 
{ 
get  
;  !
set# &
;& '
}( )
} 
} Í
mD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Servicio\TipoPagoDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{		 
public

 

class

 
TipoPagoDto

 
:

 

IEntityDto

 (
<

( )
string

) /
>

/ 0
{ 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxIdLength) 4
)4 5
]5 6
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @
Alfanumericos@ M
)M N
]N O
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxNameLength) 6
)6 7
]7 8
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @,
 AlfanumericosGuionesPuntoEspacio@ `
)` a
]a b
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} Ã
qD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Servicio\TipoServicioDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Servicio& .
{ 
public 

class 
TipoServicioDto  
:! "

IEntityDto# -
<- .
string. 4
>4 5
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
( 
DomainCommonConsts (
.( )
MaxIdLength) 4
)4 5
]5 6
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
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxNameLength) 6
)6 7
]7 8
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @,
 AlfanumericosGuionesPuntoEspacio@ `
)` a
]a b
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
} 
public 

class !
TipoServicioLookupDto &
:' (
	EntityDto) 2
<2 3
string3 9
>9 :
{ 
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} ˘
õD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\UnidadAdministrativa\Dto\ActualizarUnidadAdministrativaServicioDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% & 
UnidadAdministrativa& :
{ 
public 

class 5
)ActualizarUnidadAdministrativaServicioDto :
{		 
[ 	
Required	 
] 
public 
string 

TipoPagoId  
{! "
get# &
;& '
set( +
;+ ,
}- .
[ 	
Required	 
] 
public 
bool 
Activo 
{ 
get  
;  !
set" %
;% &
}' (
} 
} —
áD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\UnidadAdministrativa\Dto\AgregarFuncionarioDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% & 
UnidadAdministrativa& :
{ 
public 

class !
AgregarFuncionarioDto &
{		 
[

 	
Required

	 
]

 
public 
Guid 
	UsuarioId 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Required	 
] 
public 
string 
CargoId 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} œ
zD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\UnidadAdministrativa\Dto\BancoDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% & 
UnidadAdministrativa& :
{ 
public 

class 
BancoDto 
: 

IEntityDto '
<' (
string( .
>. /
{ 
[		 	
Required			 
]		 
[

 	
StringLength

	 
(

 

BankConsts

  
.

  !
MaxBankIdLength

! 0
)

0 1
]

1 2
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @
Alfanumericos@ M
)M N
]N O
public 
string 
Id 
{ 
get 
;  
set" %
;% &
}' (
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxNameLength) 6
)6 7
]7 8
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @,
 AlfanumericosGuionesPuntoEspacio@ `
)` a
]a b
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
} 
public 

class 
BancoLookupDto 
:  !
	EntityDto" +
<+ ,
string, 2
>2 3
{ 
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} Ñ
åD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\UnidadAdministrativa\Dto\ConfiguracionSignatarioDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% & 
UnidadAdministrativa& :
{ 
public 

class &
ConfiguracionSignatarioDto +
:, -

IEntityDto. 8
<8 9
Guid9 =
>= >
{		 
public

 
Guid

 
Id

 
{

 
get

 
;

 
set

 !
;

! "
}

# $
[ 	
Required	 
] 
public 
Guid 
	UsuarioId 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
StringLength	 
( 
SignatarioConsts &
.& '"
MaxNombreArchivoLength' =
)= >
]> ?
public 
virtual 
string 
NombreArchivo +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
[ 	
StringLength	 
( 
SignatarioConsts &
.& '"
MaxTipoContenidoLength' =
)= >
]> ?
public 
virtual 
string 
TipoContenido +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
[!! 	
StringLength!!	 
(!! 
SignatarioConsts!! &
.!!& '
MaxExtensionLength!!' 9
)!!9 :
]!!: ;
public"" 
virtual"" 
string"" 
	Extension"" '
{""( )
get""* -
;""- .
set""/ 2
;""2 3
}""4 5
['' 	
Required''	 
]'' 
public(( 
virtual(( 
byte(( 
[(( 
](( 
Data(( "
{((# $
get((% (
;((( )
set((* -
;((- .
}((/ 0
[-- 	
Required--	 
]-- 
[.. 	
StringLength..	 
(.. 
SignatarioConsts.. &
...& '
MaxClaveLength..' 5
)..5 6
]..6 7
public// 
virtual// 
string// 
Clave// #
{//$ %
get//& )
;//) *
set//+ .
;//. /
}//0 1
}00 
}33 ∂9
òD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\UnidadAdministrativa\Dto\CrearActualizarUnidadAdministrativaDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% & 
UnidadAdministrativa& :
{ 
public 

class 2
&CrearActualizarUnidadAdministrativaDto 7
{		 
[

 	
Required

	 
]

 
public 
virtual 
string &
TipoUnidadAdministrativaId 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
public 
virtual 
Guid 
? '
DependenciaAdministrativaId 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
[ 	
Required	 
] 
[ 	
StringLength	 
( &
UnidadAdministrativaConsts 0
.0 1
MaxCodigoLength1 @
)@ A
]A B
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @
Alfanumericos@ M
)M N
]N O
public 
virtual 
string 
Codigo $
{% &
get' *
;* +
set, /
;/ 0
}1 2
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxNameLength) 6
)6 7
]7 8
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @,
 AlfanumericosGuionesPuntoEspacio@ `
)` a
]a b
public 
virtual 
string 
Nombre $
{% &
get' *
;* +
set, /
;/ 0
}1 2
[ 	
Required	 
] 
[ 	
StringLength	 
( &
UnidadAdministrativaConsts 0
.0 1
MaxAcronymLength1 A
)A B
]B C
public 
virtual 
string 
Siglas $
{% &
get' *
;* +
set, /
;/ 0
}1 2
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )#
MaxGeographicalIdLength) @
)@ A
]A B
public 
virtual 
string 
PaisId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
[!! 	
Required!!	 
]!! 
["" 	
StringLength""	 
("" 
DomainCommonConsts"" (
.""( )#
MaxGeographicalIdLength"") @
)""@ A
]""A B
public## 
string## 
RegionId## 
{##  
get##! $
;##$ %
set##& )
;##) *
}##+ ,
[%% 	
Required%%	 
]%% 
[&& 	
StringLength&&	 
(&& 
DomainCommonConsts&& (
.&&( )
MaxAddressLength&&) 9
)&&9 :
]&&: ;
public'' 
virtual'' 
string'' 
Ciudad'' $
{''% &
get''' *
;''* +
set'', /
;''/ 0
}''1 2
[)) 	
StringLength))	 
()) 
DomainCommonConsts)) (
.))( )
MaxAddressLength))) 9
)))9 :
])): ;
public** 
virtual** 
string** 
	Direccion** '
{**( )
get*** -
;**- .
set**/ 2
;**2 3
}**4 5
[,, 	
StringLength,,	 
(,, &
UnidadAdministrativaConsts,, 0
.,,0 1
MaxCodigoPostal,,1 @
),,@ A
],,A B
public-- 
virtual-- 
string-- 
CodigoPostal-- *
{--+ ,
get--- 0
;--0 1
set--2 5
;--5 6
}--7 8
[// 	
Required//	 
]// 
public00 
virtual00 
string00 
BancoId00 %
{00& '
get00( +
;00+ ,
set00- 0
;000 1
}002 3
[22 	
Required22	 
]22 
[33 	
StringLength33	 
(33 &
UnidadAdministrativaConsts33 0
.330 1)
MaxNumeroCuentaBancariaLength331 N
)33N O
]33O P
public44 
string44  
NumeroCuentaBancaria44 *
{44+ ,
get44- 0
;440 1
set442 5
;445 6
}447 8
[66 	
Required66	 
]66 
public77 
string77  
TipoCuentaBancariaId77 *
{77+ ,
get77- 0
;770 1
set772 5
;775 6
}777 8
[99 	
Required99	 
]99 
[:: 	
StringLength::	 
(:: &
UnidadAdministrativaConsts:: 0
.::0 1*
MaxTitularCuentaBancariaLength::1 O
)::O P
]::P Q
[;; 	
RegularExpression;;	 
(;; 
DomainCommonConsts;; -
.;;- .
ExpressionRegular;;. ?
.;;? @,
 AlfanumericosGuionesPuntoEspacio;;@ `
);;` a
];;a b
public<< 
string<< !
TitularCuentaBancaria<< +
{<<, -
get<<. 1
;<<1 2
set<<3 6
;<<6 7
}<<8 9
[?? 	
Required??	 
]?? 
public@@ 
virtual@@ 
string@@ 
MonedaId@@ &
{@@' (
get@@) ,
;@@, -
set@@. 1
;@@1 2
}@@3 4
publicDD 
virtualDD 
DateTimeDD 
?DD   
FechaInicioOperacionDD! 5
{DD6 7
getDD8 ;
;DD; <
setDD= @
;DD@ A
}DDB C
publicFF 
virtualFF 
DateTimeFF 
?FF  
FechaFinOperacionFF! 2
{FF3 4
getFF5 8
;FF8 9
setFF: =
;FF= >
}FF? @
publicHH 
virtualHH 
boolHH 
ActivoHH "
{HH# $
getHH% (
;HH( )
setHH* -
;HH- .
}HH/ 0
publicJJ 
virtualJJ 
stringJJ 
NivelIdJJ %
{JJ& '
getJJ( +
;JJ+ ,
setJJ- 0
;JJ0 1
}JJ2 3
publicLL 
virtualLL 
stringLL 
ObservacionesLL +
{LL, -
getLL. 1
;LL1 2
setLL3 6
;LL6 7
}LL8 9
[OO 	
RequiredOO	 
]OO 
publicPP 
virtualPP 
ICollectionPP "
<PP" #
stringPP# )
>PP) *
JurisdiccionPP+ 7
{PP8 9
getPP: =
;PP= >
setPP? B
;PPB C
}PPD E
}SS 
}TT ø
ñD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\UnidadAdministrativa\Dto\CrearUnidadAdministrativaServicioDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% & 
UnidadAdministrativa& :
{ 
public 

class 0
$CrearUnidadAdministrativaServicioDto 5
{ 
[ 	
Required	 
] 
public		 
Guid		 

ServicioId		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
[ 	
Required	 
] 
public 
string 

TipoPagoId  
{! "
get# &
;& '
set( +
;+ ,
}- .
[ 	
Required	 
] 
public 
bool 
Activo 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ƒ
éD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\UnidadAdministrativa\Dto\GetUnidadAdministrativaInput.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% & 
UnidadAdministrativa& :
{ 
public 

class (
GetUnidadAdministrativaInput -
:. /*
PagedAndSortedResultRequestDto0 N
{ 
public 
string 
Filter 
{ 
get "
;" #
set$ '
;' (
}) *
public		 
string		 &
TipoUnidadAdministrativaId		 0
{		1 2
get		3 6
;		6 7
set		8 ;
;		; <
}		= >
}

 
} ∞
ñD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\UnidadAdministrativa\Dto\GetUnidadAdministrativaServicioInput.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% & 
UnidadAdministrativa& :
{ 
public 

class 0
$GetUnidadAdministrativaServicioInput 5
:6 7*
PagedAndSortedResultRequestDto8 V
{ 
private		 
readonly		 
string		 
SortingDefault		  .
=		/ 0
$str		1 I
;		I J
public 0
$GetUnidadAdministrativaServicioInput 3
(3 4
)4 5
{ 	
this 
. 
Sorting 
= 
SortingDefault )
;) *
} 	
public 
bool 
? 
Activo 
{ 
get !
;! "
set# &
;& '
}( )
} 
} î
{D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\UnidadAdministrativa\Dto\MonedaDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% & 
UnidadAdministrativa& :
{ 
public 

class 
	MonedaDto 
: 

IEntityDto '
<' (
string( .
>. /
{ 
[		 	
Required			 
]		 
[

 	
StringLength

	 
(

 
CurrencyConsts

 $
.

$ %
MaxCurrencyIdLength

% 8
)

8 9
]

9 :
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @
Alfanumericos@ M
)M N
]N O
public 
string 
Id 
{ 
get 
;  
set" %
;% &
}' (
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxNameLength) 6
)6 7
]7 8
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @,
 AlfanumericosGuionesPuntoEspacio@ `
)` a
]a b
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
StringLength	 
( 
CurrencyConsts $
.$ %
MaxSimboloLength% 5
)5 6
]6 7
public 
string 
Simbolo 
{ 
get  #
;# $
set% (
;( )
}* +
} 
public 

class 
MonedaLookupDto  
:! "
	EntityDto# ,
<, -
string- 3
>3 4
{ 
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} —
zD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\UnidadAdministrativa\Dto\NivelDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% & 
UnidadAdministrativa& :
{ 
public 

class 
NivelDto 
: 

IEntityDto &
<& '
string' -
>- .
{ 
[		 	
Required			 
]		 
[

 	
StringLength

	 
(

 
LevelConsts

 !
.

! "
MaxLevelIdLength

" 2
)

2 3
]

3 4
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @
Alfanumericos@ M
)M N
]N O
public 
string 
Id 
{ 
get 
; 
set! $
;$ %
}& '
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxNameLength) 6
)6 7
]7 8
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @,
 AlfanumericosGuionesPuntoEspacio@ `
)` a
]a b
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
} 
public 

class 
NivelLookupDto 
:  !
	EntityDto" +
<+ ,
string, 2
>2 3
{ 
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} Ù
D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\UnidadAdministrativa\Dto\SignatarioDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% & 
UnidadAdministrativa& :
{ 
public 

class 
SignatarioDto 
{		 
public

 
Guid

 "
UnidadAdministrativaId

 *
{

+ ,
get

- 0
;

0 1
set

2 5
;

5 6
}

7 8
public 
Guid 

ServicioId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Servicio 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
Guid 
	UsuarioId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
bool 

PorDefecto 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
bool !
PoseeFirmaElectronica )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 
public 

class "
ObtenerSignatarioInput '
{( )
public 
Guid 
? 

ServicioId 
{  !
get" %
;% &
set' *
;* +
}, -
public!! 
Guid!! 
?!! 
	UsuarioId!! 
{!!  
get!!! $
;!!$ %
set!!& )
;!!) *
}!!+ ,
public## 
bool## 
?## !
PoseeFirmaElectronica## *
{##+ ,
get##- 0
;##0 1
set##2 5
;##5 6
}##7 8
}$$ 
public&& 

class&& 
CrearSignatarioDto&& #
{'' 
[(( 	
Required((	 
](( 
public)) 
Guid)) 

ServicioId)) 
{))  
get))! $
;))$ %
set))& )
;))) *
}))+ ,
[++ 	
Required++	 
]++ 
public,, 
Guid,, 
	UsuarioId,, 
{,, 
get,,  #
;,,# $
set,,% (
;,,( )
},,* +
public.. 
bool.. 

PorDefecto.. 
{..  
get..! $
;..$ %
set..& )
;..) *
}..+ ,
}00 
}11 à
ÖD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\UnidadAdministrativa\Dto\SignatarioOutputDto.cs≥
áD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\UnidadAdministrativa\Dto\TipoCuentaBancariaDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% & 
UnidadAdministrativa& :
{ 
public 

class !
TipoCuentaBancariaDto &
:' (

IEntityDto) 3
<3 4
string4 :
>: ;
{ 
[		 	
Required			 
]		 
[

 	
StringLength

	 
(

 $
TipoCuentaBancariaConsts

 .
.

. /)
MaxTipoCuentaBancariaIdLength

/ L
)

L M
]

M N
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @
Alfanumericos@ M
)M N
]N O
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxNameLength) 6
)6 7
]7 8
[ 	
RegularExpression	 
( 
DomainCommonConsts -
.- .
ExpressionRegular. ?
.? @,
 AlfanumericosGuionesPuntoEspacio@ `
)` a
]a b
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} ¡0
âD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\UnidadAdministrativa\Dto\UnidadAdministrativaDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% & 
UnidadAdministrativa& :
{ 
public 

class #
UnidadAdministrativaDto (
:) *

IEntityDto+ 5
<5 6
Guid6 :
>: ;
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
virtual 
string &
TipoUnidadAdministrativaId 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
public 
virtual 
string $
TipoUnidadAdministrativa 6
{7 8
get9 <
;< =
set> A
;A B
}C D
public 
virtual 
Guid 
? '
DependenciaAdministrativaId 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
public 
virtual 
string %
DependenciaAdministrativa 7
{8 9
get: =
;= >
set? B
;B C
}D E
public 
virtual 
string 
Nombre $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
virtual 
string 
Siglas $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
virtual 
string 
Codigo $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
virtual 
string 
PaisId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
virtual 
string 
Pais "
{# $
get% (
;( )
set* -
;- .
}/ 0
public   
virtual   
string   
RegionId   &
{  ' (
get  ) ,
;  , -
set  . 1
;  1 2
}  3 4
public"" 
virtual"" 
string"" 
Region"" $
{""% &
get""' *
;""* +
set"", /
;""/ 0
}""1 2
public$$ 
virtual$$ 
string$$ 
Ciudad$$ $
{$$% &
get$$' *
;$$* +
set$$, /
;$$/ 0
}$$1 2
public&& 
virtual&& 
string&& 
	SubRegion&& '
{&&( )
get&&* -
;&&- .
set&&/ 2
;&&2 3
}&&4 5
public(( 
virtual(( 
string(( 
	Direccion(( '
{((( )
get((* -
;((- .
set((/ 2
;((2 3
}((4 5
public** 
virtual** 
string** 
CodigoPostal** *
{**+ ,
get**- 0
;**0 1
set**2 5
;**5 6
}**7 8
public,, 
virtual,, 
string,, 
BancoId,, %
{,,& '
get,,( +
;,,+ ,
set,,- 0
;,,0 1
},,2 3
public.. 
virtual.. 
string.. 
Banco.. #
{..$ %
get..& )
;..) *
set..+ .
;... /
}..0 1
public00 
virtual00 
string00 
MonedaId00 &
{00' (
get00) ,
;00, -
set00. 1
;001 2
}003 4
public22 
virtual22 
string22 
Moneda22 $
{22% &
get22' *
;22* +
set22, /
;22/ 0
}221 2
public44 
virtual44 
DateTime44 
?44   
FechaInicioOperacion44! 5
{446 7
get448 ;
;44; <
set44= @
;44@ A
}44B C
public66 
virtual66 
DateTime66 
?66  
FechaFinOperacion66! 2
{663 4
get665 8
;668 9
set66: =
;66= >
}66? @
public88 
virtual88 
bool88 
Activo88 "
{88# $
get88% (
;88( )
set88* -
;88- .
}88/ 0
public:: 
virtual:: 
string:: 
NivelId:: %
{::& '
get::( +
;::+ ,
set::- 0
;::0 1
}::2 3
public<< 
virtual<< 
string<< 
Nivel<< #
{<<$ %
get<<& )
;<<) *
set<<+ .
;<<. /
}<<0 1
public>> 
virtual>> 
string>> 
Observaciones>> +
{>>, -
get>>. 1
;>>1 2
set>>3 6
;>>6 7
}>>8 9
publicAA 
virtualAA 
IEnumerableAA "
<AA" #
stringAA# )
>AA) *
JurisdiccionAA+ 7
{AA8 9
getAA: =
;AA= >
setAA@ C
;AAC D
}AAE F
publicDD 
virtualDD 
stringDD  
TipoCuentaBancariaIdDD 2
{DD3 4
getDD5 8
;DD8 9
setDD: =
;DD= >
}DD? @
publicFF 
virtualFF 
stringFF 
TipoCuentaBancariaFF 0
{FF1 2
getFF3 6
;FF6 7
setFF8 ;
;FF; <
}FF= >
publicHH 
virtualHH 
stringHH !
TitularCuentaBancariaHH 3
{HH4 5
getHH6 9
;HH9 :
setHH; >
;HH> ?
}HH@ A
publicJJ 
virtualJJ 
stringJJ  
NumeroCuentaBancariaJJ 2
{JJ3 4
getJJ5 8
;JJ8 9
setJJ: =
;JJ= >
}JJ? @
}LL 
}MM ≤
íD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\UnidadAdministrativa\Dto\UnidadAdministrativaFuncionalDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% & 
UnidadAdministrativa& :
{ 
public 

class ,
 UnidadAdministrativaFuncionalDto 1
{ 
public		 
Guid		 
	UsuarioId		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Apellido 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Cargo 
{ 
get !
;! "
set# &
;& '
}( )
} 
public 

class 
FuncionarioInfoDto #
{ 
public 
Guid 
	UsuarioId 
{ 
get  #
;# $
set% (
;( )
}* +
} 
public 

class $
FuncionarioInfoExtendido )
:) *
FuncionarioInfoDto+ =
{ 
public 
string 
Cargo 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Ciudad 
{ 
get "
;" #
set$ '
;' (
}) *
public 
Guid "
UnidadAdministrativaId *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public!! 
string!! &
UnidadAdministrativaNombre!! 0
{!!1 2
get!!3 6
;!!6 7
set!!8 ;
;!!; <
}!!= >
public## 
string## &
UnidadAdministrativaPaisId## 0
{##1 2
get##3 6
;##6 7
set##8 ;
;##; <
}##= >
public%% 
string%% &
UnidadAdministrativaSiglas%% 0
{%%1 2
get%%3 6
;%%6 7
set%%8 ;
;%%; <
}%%= >
}'' 
}(( —	
çD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\UnidadAdministrativa\Dto\UnidadAdministrativaInfoDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% & 
UnidadAdministrativa& :
{ 
public 

class '
UnidadAdministrativaInfoDto ,
:- .
	EntityDto/ 8
<8 9
Guid9 =
>= >
{		 
public

 
virtual

 
string

 
Nombre

 $
{

% &
get

' *
;

* +
set

, /
;

/ 0
}

1 2
public 
virtual 
string 
PaisId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
virtual 
string 
Siglas $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
virtual 
string 
Codigo $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} ˘

ëD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\UnidadAdministrativa\Dto\UnidadAdministrativaServicioDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% & 
UnidadAdministrativa& :
{ 
public 

class +
UnidadAdministrativaServicioDto 0
{ 
public		 
Guid		 "
UnidadAdministrativaId		 *
{		+ ,
get		- 0
;		0 1
set		2 5
;		5 6
}		7 8
public 
Guid 

ServicioId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Servicio 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
TipoPago 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 

TipoPagoId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
bool 
Activo 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ™
çD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\UnidadAdministrativa\Dto\UnidadAdministrativaTipoDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% & 
UnidadAdministrativa& :
{ 
public 

class '
UnidadAdministrativaTipoDto ,
:- .

IEntityDto/ 9
<9 :
string: @
>@ A
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
public 
string 
Id 
{ 
get 
;  
set" %
;% &
}' (
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
}1 2
} 
public 

class +
UnidadAdministrativaTipoInfoDto 0
:1 2
	EntityDto3 <
<< =
string= C
>C D
{ 
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} {
yD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\UnidadAdministrativa\Dto\UserDto.cs˘
~D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\UnidadAdministrativa\IBancoAppService.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% & 
UnidadAdministrativa& :
{ 
public		 

	interface		 
IBancoAppService		 %
:		& '
ICrudAppService		( 7
<		7 8
BancoDto		8 @
,		@ A
string		B H
>		H I
{

 
Task 
< 
ListResultDto 
< 
BancoLookupDto )
>) *
>* +
GetLookupAsync, :
(: ;
); <
;< =
} 
} Ñ
êD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\UnidadAdministrativa\IConfiguracionSignatarioAppService.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% & 
UnidadAdministrativa& :
{ 
public 

	interface .
"IConfiguracionSignatarioAppService 7
:8 9
IApplicationService: M
{		 
Task

 
<

 &
ConfiguracionSignatarioDto

 '
>

' (
GetAsync

) 1
(

1 2
Guid

2 6
	usuarioId

7 @
)

@ A
;

A B
Task 
< &
ConfiguracionSignatarioDto '
>' (
CreateAsync) 4
(4 5&
ConfiguracionSignatarioDto5 O
inputP U
)U V
;V W
Task 
< &
ConfiguracionSignatarioDto '
>' (
UpdateAsync) 4
(4 5
Guid5 9
id: <
,< =&
ConfiguracionSignatarioDto> X
inputY ^
)^ _
;_ `
Task 
DeleteAsync 
( 
Guid 
	usuarioId '
)' (
;( )
Task 
< 
List 
< 
Guid 
> 
> $
PoseenConfiguracionAsync 1
(1 2
List2 6
<6 7
Guid7 ;
>; <
usuariosIds= H
)H I
;I J
Task 
< 
bool 
> $
PoseenConfiguracionAsync +
(+ ,
Guid, 0

usuariosId1 ;
); <
;< =
}   
}## ˘
~D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\UnidadAdministrativa\ILibroAppService.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% & 
UnidadAdministrativa& :
{ 
public		 

	interface		 
ILibroAppService		 %
:		& '
ICrudAppService		( 7
<		7 8
LibroDto		8 @
,		@ A
string		B H
>		H I
{

 
Task 
< 
ListResultDto 
< 
LibroLookupDto )
>) *
>* +
GetLookupAsync, :
(: ;
); <
;< =
} 
} ˝
D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\UnidadAdministrativa\IMonedaAppService.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% & 
UnidadAdministrativa& :
{ 
public		 

	interface		 
IMonedaAppService		 &
:		' (
ICrudAppService		) 8
<		8 9
	MonedaDto		9 B
,		B C
string		D J
>		J K
{

 
Task 
< 
ListResultDto 
< 
MonedaLookupDto *
>* +
>+ ,
GetLookupAsync- ;
(; <
)< =
;= >
} 
} ˘
~D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\UnidadAdministrativa\INivelAppService.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% & 
UnidadAdministrativa& :
{ 
public 

	interface 
INivelAppService %
:& '
ICrudAppService( 7
<7 8
NivelDto8 @
,@ A
stringB H
>H I
{		 
Task

 
<

 
ListResultDto

 
<

 
NivelLookupDto

 )
>

) *
>

* +
GetLookupAsync

, :
(

: ;
)

; <
;

< =
} 
} ®
ãD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\UnidadAdministrativa\ITipoCuentaBancariaAppService.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% & 
UnidadAdministrativa& :
{		 
public 

	interface )
ITipoCuentaBancariaAppService 2
:3 4
ICrudAppService5 D
<D E!
TipoCuentaBancariaDtoE Z
,Z [
string\ b
>b c
{ 
Task 
< 
ListResultDto 
< !
TipoCuentaBancariaDto 0
>0 1
>1 2
GetLookupAsync3 A
(A B
)B C
;C D
} 
} ¡<
çD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\UnidadAdministrativa\IUnidadAdministrativaAppService.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% & 
UnidadAdministrativa& :
{		 
public 

	interface +
IUnidadAdministrativaAppService 4
:5 6
ICrudAppService 
< #
UnidadAdministrativaDto .
,. /
Guid 
, (
GetUnidadAdministrativaInput '
,' (2
&CrearActualizarUnidadAdministrativaDto 1
>1 2
{ 
Task 
< #
UnidadAdministrativaDto $
>$ %!
ObtenerPorCodigoAsync& ;
(; <
string< B
codigoC I
)I J
;J K
Task 
< 
ListResultDto 
< '
UnidadAdministrativaInfoDto 6
>6 7
>7 8,
 GetLookupAdministrativeUnitAsync9 Y
(Y Z
)Z [
;[ \
Task 
< 
ListResultDto 
< '
UnidadAdministrativaInfoDto 6
>6 7
>7 87
+ObtenerUnidadAdministrativaPorServicioAsync9 d
(d e
Guide i

servicioIdj t
)t u
;u v
public 
Task 
< 
ListResultDto !
<! "'
UnidadAdministrativaInfoDto" =
>= >
>> ?3
'ObtenerUnidadAdminsitrativaPorPaisAsync@ g
(g h
stringh n

codigoPaiso y
)y z
;z {
public 
Task 
< 
ListResultDto !
<! "'
UnidadAdministrativaInfoDto" =
>= >
>> ?;
/ObtenerUnidadAdministrativaPorServicioPaisAsync@ o
(o p
Guidp t

servicioIdu 
,	 Ä
string
Å á

codigoPais
à í
)
í ì
;
ì î
public 
Task 
< 
ListResultDto !
<! "'
UnidadAdministrativaInfoDto" =
>= >
>> ?A
5ObtenerUnidadAdministrativaPorCiudadJurisdiccionAsync@ u
(u v
stringv |
ciudad	} É
)
É Ñ
;
Ñ Ö
Task%% 
<%% 
ListResultDto%% 
<%% '
UnidadAdministrativaInfoDto%% 6
>%%6 7
>%%7 8
ObtenerPorListaIds%%9 K
(%%K L
List%%L P
<%%P Q
Guid%%Q U
>%%U V
ids%%W Z
)%%Z [
;%%[ \
Task'' 
CambiarEstadoAsync'' 
(''  
Guid''  $"
unidadAdministrativaId''% ;
,''; <
bool''= A
activo''B H
)''H I
;''I J
public** 
Task** #
AssignMissionChiefAsync** +
(**+ ,
Guid**, 0"
unidadAdministrativaId**1 G
,**G H
Guid**I M
userId**N T
)**T U
;**U V
Task-- !
AgregarFuncionalAsync-- "
(--" #
Guid--# '"
unidadAdministrativaId--( >
,--> ?!
AgregarFuncionarioDto--@ U
input--V [
)--[ \
;--\ ]
public00 
Task00 
<00 
PagedResultDto00 "
<00" #,
 UnidadAdministrativaFuncionalDto00# C
>00C D
>00D E#
ObtenerFuncionalesAsync00F ]
(00] ^
Guid00^ b"
unidadAdministrativaId00c y
)00y z
;00z {
public33 
Task33 "
EliminarFuncionalAsync33 *
(33* +
Guid33+ /"
unidadAdministrativaId330 F
,33F G
Guid33H L
userId33M S
)33S T
;33T U
public88 
Task88 
<88 
ListResultDto88 !
<88! "
ServicioDto88" -
>88- .
>88. /2
&ObtenerServiciosPorTipoDeServicioAsync880 V
(88V W
Guid88W [ 
administrativeUnitId88\ p
,88p q
string88r x
tipoServicioId	88y á
)
88á à
;
88à â
public:: 
Task:: 
<:: 
PagedResultDto:: "
<::" #+
UnidadAdministrativaServicioDto::# B
>::B C
>::C D!
ObtenerServiciosAsync::E Z
(::Z [
Guid::[ _"
unidadAdministrativaId::` v
,::v w1
$GetUnidadAdministrativaServicioInput	::x ú
input
::ù ¢
)
::¢ £
;
::£ §
public== 
Task== 
<== +
UnidadAdministrativaServicioDto== 3
>==3 4 
ObtenerServicioAsync==5 I
(==I J
Guid==J N"
unidadAdministrativaId==O e
,==e f
Guid==g k

servicioId==l v
)==v w
;==w x
public?? 
Task?? 
<?? +
UnidadAdministrativaServicioDto?? 3
>??3 4 
AgregarServicioAsync??5 I
(??I J
Guid??J N"
unidadAdministrativaId??O e
,??e f1
$CrearUnidadAdministrativaServicioDto	??g ã
input
??å ë
)
??ë í
;
??í ì
publicAA 
TaskAA 
<AA +
UnidadAdministrativaServicioDtoAA 3
>AA3 4#
ActualizarServicioAsyncAA5 L
(AAL M
GuidAAM Q"
unidadAdministrativaIdAAR h
,AAh i
GuidAAj n

servicioIdAAo y
,AAy z6
)ActualizarUnidadAdministrativaServicioDto	AA{ §
input
AA• ™
)
AA™ ´
;
AA´ ¨
publicCC 
TaskCC !
EliminarServicioAsyncCC )
(CC) *
GuidCC* ."
unidadAdministrativaIdCC/ E
,CCE F
GuidCCG K

servicioIdCCL V
)CCV W
;CCW X
publicEE 
TaskEE 
<EE 
ListResultDtoEE !
<EE! "
ServicioDtoEE" -
>EE- .
>EE. /
GetLookupAsyncEE0 >
(EE> ?
GuidEE? C"
unidadAdministrativaIdEED Z
)EEZ [
;EE[ \
publicGG 
TaskGG 
<GG 
ListResultDtoGG !
<GG! "
ServicioDtoGG" -
>GG- .
>GG. /3
'ObtenerServiciosPorUnidadAdministrativaGG0 W
(GGW X
GuidGGX \"
unidadAdministrativaIdGG] s
)GGs t
;GGt u
publicNN 
TaskNN 
<NN 
PagedResultDtoNN "
<NN" #
SignatarioDtoNN# 0
>NN0 1
>NN1 2#
ObtenerSignatariosAsyncNN3 J
(NNJ K
GuidNNK O"
unidadAdministrativaIdNNP f
)NNf g
;NNg h
publicPP 
TaskPP 
<PP 
ListResultDtoPP !
<PP! "
SignatarioDtoPP" /
>PP/ 0
>PP0 1"
BuscarSignatariosAsyncPP2 H
(PPH I
GuidPPI M"
unidadAdministrativaIdPPN d
,PPd e"
ObtenerSignatarioInputPPe {
input	PP| Å
)
PPÅ Ç
;
PPÇ É
publicRR 
TaskRR "
AgregarSignatarioAsyncRR *
(RR* +
GuidRR+ /"
unidadAdministrativaIdRR0 F
,RRF G
CrearSignatarioDtoRRH Z
inputRR[ `
)RR` a
;RRa b
publicTT 
TaskTT #
EliminarSignatarioAsyncTT +
(TT+ ,
GuidTT, 0"
unidadAdministrativaIdTT1 G
,TTG H
GuidTTI M
userIdTTN T
,TTT U
GuidTTV Z

servicioIdTT[ e
)TTe f
;TTf g
}[[ 
}^^ ˚

åD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\UnidadAdministrativa\IUnidadAdministrativaFuncional.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% & 
UnidadAdministrativa& :
{ 
public 

	interface *
IUnidadAdministrativaFuncional 3
{4 5
Task		 
<		 '
UnidadAdministrativaInfoDto		 (
>		( )8
,ObtenerUnidadAdministrativaDelFuncionalAsync		* V
(		V W
Guid		W [
	usuarioId		\ e
)		e f
;		f g
Task 
< '
UnidadAdministrativaInfoDto (
>( )>
2ObtenerUnidadAdministrativaDelFuncionalActualAsync* \
(\ ]
)] ^
;^ _
Task 
< 
PagedResultDto 
< 
FuncionarioInfoDto .
>. /
>/ 0;
/ObtenerFuncionariosPorUnidadAdministrativaAsync1 `
(` a
Guida e"
unidadAdministrativaIdf |
)| }
;} ~
Task 
< $
FuncionarioInfoExtendido %
>% &/
#ObtenerFuncionarioPorUsuarioIdAsync' J
(J K
GuidK O
	usuarioIdP Y
)Y Z
;Z [
} 
} À
ëD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\UnidadAdministrativa\IUnidadAdministrativaTipoAppService.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% & 
UnidadAdministrativa& :
{ 
public 

	interface /
#IUnidadAdministrativaTipoAppService 8
:9 :
ICrudAppService; J
<J K'
UnidadAdministrativaTipoDtoK f
,f g
string 
> 
{		 
Task 
< 
ListResultDto 
< +
UnidadAdministrativaTipoInfoDto :
>: ;
>; <!
ObtenerListaInfoAsync= R
(R S
)S T
;T U
} 
} ë
ÄD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Ventanilla\CrearActualizarVentanillaDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &

Ventanilla& 0
{ 
public 

class (
CrearActualizarVentanillaDto -
{ 
[		 	
Required			 
]		 
public

 
Guid

 "
UnidadAdministrativaId

 *
{

+ ,
get

- 0
;

0 1
set

2 5
;

5 6
}

7 8
[ 	
Required	 
] 
[ 	
StringLength	 
( 
DomainCommonConsts (
.( )
MaxNameLength) 6
)6 7
]7 8
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
public 
bool 
AtencionPresencial &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
bool 
AtencionVirtual #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
InicioAtencion $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
FinAtencion !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
bool 
Activo 
{ 
get  
;  !
set" %
;% &
}' (
} 
} Ô
yD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Ventanilla\GetVentanillaInputDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &

Ventanilla& 0
{ 
public 

class !
GetVentanillaInputDto &
:' (*
PagedAndSortedResultRequestDto) G
{ 
public 
string 
Filter 
{ 
get "
;" #
set$ '
;' (
}) *
} 
}		 ™
yD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Ventanilla\IVentanillaAppService.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &

Ventanilla& 0
{ 
public 

	interface !
IVentanillaAppService *
:+ ,
ICrudAppService- <
<< =
VentanillaDto= J
,J K
GuidL P
,P Q!
GetVentanillaInputDtoR g
,g h(
CrearActualizarVentanillaDto		  
>		  !
{

 
Task 
< 
PagedResultDto 
< 
VentanillaDto )
>) *
>* +1
%ObtenerPorUnidadAdministrativaIdAsync, Q
(Q R
GuidR V"
unidadAdministrativaIdW m
)m n
;n o
} 
} ⁄
qD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Application.Contracts\Ventanilla\VentanillaDto.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &

Ventanilla& 0
{ 
public 

class 
VentanillaDto 
:  

IEntityDto! +
<+ ,
Guid, 0
>0 1
{		 
public

 
Guid

 
Id

 
{

 
get

 
;

 
set

 !
;

! "
}

# $
public 
Guid  
AdministrativeUnitId (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
bool !
IsPresentialAttention )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
bool 
IsVirtualAttention &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
AttentionStart $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
AttentionEnd "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
bool 
IsActive 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} 