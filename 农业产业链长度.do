

use 总名单1995.dta
gen 欧盟=0
gen 其它经济体=0
replace 欧盟=1 if 国家=="Austria"
replace 欧盟=1 if 国家=="Belgium"

replace 欧盟=1 if 国家=="Bulgaria"
replace 欧盟=1 if 国家=="Croatia"
replace 欧盟=1 if 国家=="Cyprus"
replace 欧盟=1 if 国家=="Czech Republic"
replace 欧盟=1 if 国家=="Denmark"
replace 欧盟=1 if 国家=="Estonia"
replace 欧盟=1 if 国家=="Finland"
replace 欧盟=1 if 国家=="France"
replace 欧盟=1 if 国家=="Germany"
replace 欧盟=1 if 国家=="Greece"
replace 欧盟=1 if 国家=="Hungary"
replace 欧盟=1 if 国家=="Ireland"
replace 欧盟=1 if 国家=="Italy"
replace 欧盟=1 if 国家=="Latvia"
replace 欧盟=1 if 国家=="Lithuania"
replace 欧盟=1 if 国家=="Luxembourg"

replace 欧盟=1 if 国家=="Malta"

replace 欧盟=1 if 国家=="Netherlands"
replace 欧盟=1 if 国家=="Poland"
replace 欧盟=1 if 国家=="Portugal"
replace 欧盟=1 if 国家=="Romania"
replace 欧盟=1 if 国家=="Slovakia"
replace 欧盟=1 if 国家=="Slovenia"
replace 欧盟=1 if 国家=="Sweden"
replace 欧盟=1 if 国家=="UK"



replace 其它经济体=1 if 国家=="Australia"
replace 其它经济体=1 if 国家=="Canada"
replace 其它经济体=1 if 国家=="Mexico"


replace 其它经济体=1 if 国家=="Taiwan"


replace 其它经济体=1 if 国家=="Norway"
replace 其它经济体=1 if 国家=="Turkey"
replace 其它经济体=1 if 国家=="Brazil"
replace 其它经济体=1 if 国家=="Japan"
replace 其它经济体=1 if 简称=="USA" 
replace 其它经济体=0 if 其它经济体==.

isvar yes* nochn* nousa* noaut* noaus*  nobel*  nobra*  nodnk*  nofin*  nofra* nodeu*    noirl*  noita*  nolux*  nomlt*  nonld*  noprt*  noswe*  nogbr*  nojpn*  nonor*   nocan*  nomex* notwn*
return list
keep 国家 简称 产业 一带一路 简称与行业代码  `r(varlist)' 欧盟 其它经济体
replace 一带一路=1 if 简称=="CHN" 
drop if (一带一路==0 & 欧盟==0 & 其它经济体==0)


ds 国家 简称 产业 一带一路 简称与行业代码 欧盟 其它经济体,not



egen total_immediate=rowtotal(`r(varlist)')
mata:
TOTIMM=st_data((1::2262),"total_immediate")
end



mata:
	
	B=st_data((1::2262),(6..2267))
	U2262=J(1,2262,1)
	TOT2=U2262*B
	
end



mata:
	
	
	VA=st_data(2263,(6..2267))
	
	
end



save 加其它经济体一带一路总名单1995.dta, replace
*计算总产出
use 最终需求1995.dta 

gen 欧盟=0
gen 其它经济体=0
replace 欧盟=1 if 国家=="Austria"
replace 欧盟=1 if 国家=="Belgium"

replace 欧盟=1 if 国家=="Bulgaria"
replace 欧盟=1 if 国家=="Croatia"
replace 欧盟=1 if 国家=="Cyprus"
replace 欧盟=1 if 国家=="Czech Republic"
replace 欧盟=1 if 国家=="Denmark"
replace 欧盟=1 if 国家=="Estonia"
replace 欧盟=1 if 国家=="Finland"
replace 欧盟=1 if 国家=="France"
replace 欧盟=1 if 国家=="Germany"
replace 欧盟=1 if 国家=="Greece"
replace 欧盟=1 if 国家=="Hungary"
replace 欧盟=1 if 国家=="Ireland"
replace 欧盟=1 if 国家=="Italy"
replace 欧盟=1 if 国家=="Latvia"
replace 欧盟=1 if 国家=="Lithuania"
replace 欧盟=1 if 国家=="Luxembourg"
replace 欧盟=1 if 国家=="Malta"
replace 欧盟=1 if 国家=="Netherlands"
replace 欧盟=1 if 国家=="Poland"
replace 欧盟=1 if 国家=="Portugal"
replace 欧盟=1 if 国家=="Romania"
replace 欧盟=1 if 国家=="Slovakia"
replace 欧盟=1 if 国家=="Slovenia"
replace 欧盟=1 if 国家=="Sweden"
replace 欧盟=1 if 国家=="UK"


/*
replace 其它经济体=1 if 国家=="South Korea"
*/
replace 其它经济体=1 if 国家=="Australia"
replace 其它经济体=1 if 国家=="Canada"
replace 其它经济体=1 if 国家=="Mexico"

replace 其它经济体=1 if 国家=="Taiwan"

replace 其它经济体=1 if 国家=="Norway"
replace 其它经济体=1 if 国家=="Turkey"
replace 其它经济体=1 if 国家=="Brazil"
replace 其它经济体=1 if 国家=="Japan"
replace 其它经济体=1 if 简称=="USA" 
replace 其它经济体=0 if 其它经济体==.

isvar yes* nochn* nousa* noaut* noaus*  nobel*  nobra*  nodnk*  nofin*  nofra* nodeu*    noirl*  noita*  nolux*  nomlt*  nonld*  noprt*  noswe*  nogbr*  nojpn*  nonor*   nocan*  nomex* notwn*
return list
keep 国家 简称 产业 一带一路 简称与行业代码  `r(varlist)' 欧盟 其它经济体
replace 一带一路=1 if 简称=="CHN" 
drop if (一带一路==0 & 欧盟==0 & 其它经济体==0)


ds 国家 简称 产业 一带一路 简称与行业代码 欧盟 其它经济体,not
egen totalfd=rowtotal(`r(varlist)')

save C:\Users\zhupa\Desktop\try\加其它经济体一带一路最终需求1995.dta, replace


*计算总产出向量OUTPUT
*计算直接消耗系数矩阵B
*计算里昂惕夫逆矩阵
*删除B释放空间    mata drop B
*计算增加值比例矩阵VAPHAT

mata:
	
	TOTFD=st_data((1::2262),"totalfd")
	OUTPUT=(TOTIMM+TOTFD)'
	

	VA2=OUTPUT-TOT2
	OUTPUT2=TOT2+VA
	OUTPUT3=(OUTPUT+OUTPUT2)*0.5
	VA3=(VA2+VA)*0.5
	
	A=B:/(OUTPUT)
	A2=B:/(OUTPUT2)
	A3=B:/(OUTPUT3)


	I=I(2262)
	L=luinv(I-A)

	
	
	
	VAPHAT=diag(VA:/OUTPUT)
	VAPHAT2=diag(VA2:/OUTPUT)
	VAPHAT3=diag(VA3:/OUTPUT)
	OUTPUTHAT=diag(TOTFD)
end




mata:
	
	PLV=VAPHAT2*L*TOTFD
	PLX=VAPHAT2*L*L*TOTFD
	PL=PLX:/PLV
	
	
end




clear



set obs 87

mata:
	st_addvar("double","PL")
	store=J(87,1,0)
	for (i=1;i<2262;i=i+26){
		y=floor(i/26)+1
		
		
		store[y,1]=PL[i,1]
	
		
	
	}
	
	
	st_store(.,"PL",store)
end

gen id=_n
gen year=1995
save 农业生产链长度1995.dta,replace






