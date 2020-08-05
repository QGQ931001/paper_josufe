use "总名单1995.dta"
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



save "加其它经济体一带一路总名单1995.dta", replace
*计算总产出
use "最终需求1995.dta" 

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

save "加其它经济体一带一路最终需求1995.dta", replace


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



*计算两两国家间品贸易矩阵(共计87个国家或地区)；中国为443到468行列
clear
*共522（6*87）列最终需求
use "加其它经济体一带一路最终需求1995.dta" 
mata:
	SUMM=J(522,87,0)
	for (i=0;i<=86;i++){
		
		SUMM[|(i*6+1,i+1)\((i+1)*6,i+1)|]=(1,1,1,1,1,1)'
		
	}
	
end



gen var531= "c"+ strofreal(_n)


mata:
		FDTOF=st_data((1::2262),(6..527))
		FDTOFSUM=FDTOF*SUMM
		cname=st_sdata(1::87,531)
		
end



clear
set obs 2262

mata:

	st_addvar("double",cname')
	st_store(.,cname',FDTOFSUM)

end

save "加其它经济体一带一路合并最终需求1995.dta",replace
clear
use "加其它经济体一带一路合并最终需求1995.dta"



mata:
YCEXP=st_data(1::2262,1..87)
end


clear

*求中间品出口分解矩阵与最终需求贸易出口分解矩阵
set obs 87

mata:
	st_addvar("double",("DVACIMA","DVACFDA","DVACA","DBCCAFD","DBCCAIM","DBCCA"))
	store=J(87,6,0)
	for (i=1;i<2262;i=i+26){
		y=floor(i/26)+1
		YCEXPM2=diag(YCEXP[,y])
		ACBAR=A
		ACBAR[|(443,i)\(468,i+25)|]=J(26,26,0)
		AC=A-ACBAR
		YCEXPMBAR2=YCEXPM2
		YCEXPMBAR2[|(443,443)\(468,468)|]=J(26,26,0)
		YC2=YCEXPM2-YCEXPMBAR2
		LACBAR=luinv(I(2262)-ACBAR)
		LLACBAR=luinv(I(2262)-AC*LACBAR)
		
	




		IXC=VAPHAT2*LACBAR*AC*LACBAR*LLACBAR*LLACBAR*OUTPUTHAT
		FDIXC=VAPHAT2*L*YC2
		EPC=IXC+FDIXC

		VACIM=VAPHAT2*LACBAR*AC*LACBAR*LLACBAR*OUTPUTHAT
		VACFD=VAPHAT2*LACBAR*YC2
		VAC=VACIM+VACFD
		
		
/*
		U26=J(1,26,1)
*/
		U2262=J(2262,1,1)

		
		VACIMA=VACIM[443,1..2262]*U2262
		VACFDA=VACFD[443,1..2262]*U2262
		VACA=VAC[443,1..2262]*U2262
		
		BCCAFD=(FDIXC[443,1..2262]*U2262):/(VACFDA)
		BCCAIM=(IXC[443,1..2262]*U2262):/(VACIMA)
		BCCA=(EPC[443,1..2262]*U2262):/(VACA)
		
		
		store[y,1]=VACIMA
		store[y,2]=VACFDA
		store[y,3]=VACA
		store[y,4]=BCCAFD
		store[y,5]=BCCAIM
		store[y,6]=BCCA
		
	
	}
	
	
	st_store(.,("DVACIMA","DVACFDA","DVACA","DBCCAFD","DBCCAIM","DBCCA"),store)
end






set obs 87


mata:
	st_addvar("double",("FVACIMA","FVACFDA","FVACA","FBCCAFD","FBCCAIM","FBCCA"))
	store=J(87,6,0)
	for (i=1;i<2262;i=i+26){
		y=floor(i/26)+1
		YCEXPM2=diag(YCEXP[,18])
		ACBAR=A
		ACBAR[|(i,443)\(i+25,468)|]=J(26,26,0)
		AC=A-ACBAR
		YCEXPMBAR2=YCEXPM2
		YCEXPMBAR2[|(i,i)\(i+25,i+25)|]=J(26,26,0)
		YC2=YCEXPM2-YCEXPMBAR2
		LACBAR=luinv(I(2262)-ACBAR)
		LLACBAR=luinv(I(2262)-AC*LACBAR)
		
		




		
		
				
/*
		BCC=(U26*EPC[i::i+25,1..2262]*U2262):/(U26*VAC[i::i+25,1..2262]*U2262)
		
		store[y,1]=BCC[1,1]
*/
		
		
		IXC=VAPHAT2*LACBAR*AC*LACBAR*LLACBAR*LLACBAR*OUTPUTHAT
		FDIXC=VAPHAT2*L*YC2
		EPC=IXC+FDIXC

		VACIM=VAPHAT2*LACBAR*AC*LACBAR*LLACBAR*OUTPUTHAT
		VACFD=VAPHAT2*LACBAR*YC2
		VAC=VACIM+VACFD
		
		
/*
		U26=J(1,26,1)
*/
		U2262=J(2262,1,1)

		
		VACIMA=VACIM[i,1..2262]*U2262
		VACFDA=VACFD[i,1..2262]*U2262
		VACA=VAC[i,1..2262]*U2262
		
		BCCAFD=(FDIXC[i,1..2262]*U2262):/(VACFDA)
		BCCAIM=(IXC[i,1..2262]*U2262):/(VACIMA)
		BCCA=(EPC[i,1..2262]*U2262):/(VACA)
		
		
		store[y,1]=VACIMA[1,1]
		store[y,2]=VACFDA[1,1]
		store[y,3]=VACA[1,1]
		store[y,4]=BCCAFD[1,1]
		store[y,5]=BCCAIM[1,1]
		store[y,6]=BCCA[1,1]
	
	}
	
	
	st_store(.,("FVACIMA","FVACFDA","FVACA","FBCCAFD","FBCCAIM","FBCCA"),store)
end
save "农业增加值跨境次数1995.dta"
