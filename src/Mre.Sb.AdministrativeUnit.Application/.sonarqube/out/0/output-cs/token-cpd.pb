®
uD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain.Shared\AdministrativeUnitDomainSharedModule.cs
	namespace		 	
Mre		
 
.		 
Sb		 
.		  
UnidadAdministrativa		 %
{

 
[ 
	DependsOn 
( 
typeof 
( 
AbpValidationModule "
)" #
) 
] 
public 

class 0
$AdministrativeUnitDomainSharedModule 5
:6 7
	AbpModule8 A
{ 
public 
override 
void 
ConfigureServices .
(. /'
ServiceConfigurationContext/ J
contextK R
)R S
{ 	
	Configure 
< '
AbpVirtualFileSystemOptions 1
>1 2
(2 3
options3 :
=>; =
{ 
options 
. 
FileSets  
.  !
AddEmbedded! ,
<, -0
$AdministrativeUnitDomainSharedModule- Q
>Q R
(R S
)S T
;T U
} 
) 
; 
	Configure 
< "
AbpLocalizationOptions ,
>, -
(- .
options. 5
=>6 8
{ 
options 
. 
	Resources !
. 
Add 
< &
AdministrativeUnitResource 3
>3 4
(4 5
$str5 9
)9 :
. 
AddBaseTypes !
(! "
typeof" (
(( )!
AbpValidationResource) >
)> ?
)? @
. 
AddVirtualJson #
(# $
$str$ F
)F G
;G H
} 
) 
; 
	Configure 
< +
AbpExceptionLocalizationOptions 5
>5 6
(6 7
options7 >
=>? A
{   
options!! 
.!! 
MapCodeNamespace!! (
(!!( )
$str!!) =
,!!= >
typeof!!? E
(!!E F&
AdministrativeUnitResource!!F `
)!!` a
)!!a b
;!!b c
}"" 
)"" 
;"" 
}## 	
}$$ 
}%% Ç
mD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain.Shared\AdministrativeUnitErrorCodes.cs
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
class (
AdministrativeUnitErrorCodes 4
{ 
} 
}  
cD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain.Shared\DomainCommonConsts.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

static 
class 
DomainCommonConsts *
{ 
public 
const 
int 
MaxIdLength $
=% &
$num' (
;( )
public 
const 
int 
MaxNameLength &
=' (
$num) +
;+ ,
public 
const 
int  
MaxDescriptionLength -
=. /
$num0 3
;3 4
public 
const 
int 
MaxAddressLength )
=* +
$num, /
;/ 0
public 
const 
int #
MaxGeographicalIdLength 0
=1 2
$num3 5
;5 6
public"" 
static"" 
class"" 
ExpressionRegular"" -
{"". /
public%% 
const%% 
string%% 
Alfanumericos%%  -
=%%. /
$str%%0 8
;%%8 9
public'' 
const'' 
string'' ,
 AlfanumericosGuionesPuntoEspacio''  @
=''A B
$str''C e
;''e f
}** 	
},, 
}-- í
xD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain.Shared\Localization\AdministrativeUnitResource.cs
	namespace 	
Mre
 
. 
Sb 
. 
AdministrativeUnit #
.# $
Localization$ 0
{ 
[ $
LocalizationResourceName 
( 
$str 2
)2 3
]3 4
public 

class &
AdministrativeUnitResource +
{ 
}		 
}

 ˚
cD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain.Shared\Service\BookConsts.cs
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
class 

BookConsts 
{ 
public 
const 
int 
MaxBookIdLength (
=) *
$num+ ,
;, -
} 
} π
qD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain.Shared\Service\EntidadAuspicianteConsts.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

static 
class $
EntidadAuspicianteConsts 0
{ 
public

 
const

 
int

 )
MaxEntidadAuspicianteIdLength

 6
=

7 8
$num

9 :
;

: ;
} 
} µ
lD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain.Shared\Service\TariffHeadingConsts.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

static 
class 
TariffHeadingConsts +
{ 
public

 
const

 
int

 /
#MaxTariffHeadingHeadingNumberLength

 <
=

= >
$num

? @
;

@ A
} 
} ∞
nD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain.Shared\Service\TariffHierarchyConsts.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

static 
class !
TariffHierarchyConsts -
{ 
public

 
const

 
int

 &
MaxTariffHierarchyIdLength

 3
=

4 5
$num

6 7
;

7 8
} 
} °
iD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain.Shared\Service\TariffTypeConsts.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

static 
class 
TariffTypeConsts (
{ 
public

 
const

 
int

 !
MaxTariffTypeIdLength

 .
=

/ 0
$num

1 2
;

2 3
} 
} ∞
nD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain.Shared\Service\TipoExoneracionConsts.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

static 
class !
TipoExoneracionConsts -
{ 
public

 
const

 
int

 &
MaxTipoExoneracionIdLength

 3
=

4 5
$num

6 7
;

7 8
} 
} Ÿ
ÑD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain.Shared\UnidadAdministrativa\AdministrativeDependencyConsts.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

static 
class *
AdministrativeDependencyConsts 6
{ 
public 
const 
int /
#MaxAdministrativeDependencyIdLength <
== >
$num? @
;@ A
}		 
}

 Ω
ÇD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain.Shared\UnidadAdministrativa\AdministrativeUnitTypeConsts.cs
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

static 
class (
AdministrativeUnitTypeConsts 4
{ 
public 
const 
int 
MaxIdLength $
=% &
$num' (
;( )
} 
} ú
pD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain.Shared\UnidadAdministrativa\BankConsts.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

static 
class 

BankConsts "
{ 
public

 
const

 
int

 
MaxBankIdLength

 (
=

) *
$num

+ ,
;

, -
} 
} ù
qD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain.Shared\UnidadAdministrativa\CityConsts .cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

static 
class 

CityConsts "
{ 
public 
const 
int 
MaxCityIdLength (
=) *
$num+ ,
;, -
} 
} Æ
tD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain.Shared\UnidadAdministrativa\CurrencyConsts.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

static 
class 
CurrencyConsts &
{ 
public		 
const		 
int		 
MaxCurrencyIdLength		 ,
=		- .
$num		/ 0
;		0 1
public 
const 
int 
MaxSimboloLength )
=* +
$num, -
;- .
} 
} ü
qD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain.Shared\UnidadAdministrativa\LevelConsts.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

static 
class 
LevelConsts #
{ 
public

 
const

 
int

 
MaxLevelIdLength

 )
=

* +
$num

, -
;

- .
} 
} «
vD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain.Shared\UnidadAdministrativa\SignatarioConsts.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

static 
class 
SignatarioConsts (
{ 
public 
const 
int "
MaxNombreArchivoLength /
=0 1
$num2 5
;5 6
public 
const 
int "
MaxTipoContenidoLength /
=0 1
$num2 4
;4 5
public 
const 
int 
MaxExtensionLength +
=, -
$num. /
;/ 0
public 
const 
int 
MaxClaveLength '
=( )
$num* -
;- .
} 
} ∆
~D:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain.Shared\UnidadAdministrativa\TipoCuentaBancariaConsts.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

static 
class $
TipoCuentaBancariaConsts 0
{ 
public

 
const

 
int

 )
MaxTipoCuentaBancariaIdLength

 6
=

7 8
$num

9 :
;

: ;
} 
} Ô
ÄD:\MREGITHUB\UnidadAdministrativa\src\Mre.Sb.AdministrativeUnit.Domain.Shared\UnidadAdministrativa\UnidadAdministrativaConsts.cs
	namespace 	
Mre
 
. 
Sb 
.  
UnidadAdministrativa %
.% &
Dominio& -
{ 
public 

static 
class &
UnidadAdministrativaConsts 2
{ 
public		 
const		 
int		 
MaxCodigoLength		 (
=		) *
$num		+ ,
;		, -
public 
const 
int 
MaxAcronymLength )
=* +
$num, -
;- .
public 
const 
int )
MaxNumeroCuentaBancariaLength 6
=7 8
$num9 ;
;; <
public 
const 
int *
MaxTitularCuentaBancariaLength 7
=8 9
$num: <
;< =
public 
const 
int 
MaxCodigoPostal (
=) *
$num+ -
;- .
}"" 
}## 