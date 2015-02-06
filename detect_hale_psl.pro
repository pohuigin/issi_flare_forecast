;Determine the global polarity separation line

pro detect_hale_psl

hmids='hmi.M_720s'

time=anytim(anytim(systim(/utc))-3600.*24.*5.,/vms)

ssw_jsoc_time2data,time,time,indhmi,fhmi,cadence=cadence,ds=hmids,/jsoc2,/files

read_sdo, fhmi, dum, dat

mindex2map,indhmi,dat,map,/nest

map1k=map_rebin(map,/rebin1k)

map1kp=ar_processmag(map1k)

datsm20=ar_grow(map1kp.data,rad=20,/gaus)

datsm10=ar_grow(map1kp.data,rad=10,/gaus)

;plot_image,magscl(dat,min=-50,max=50)
plot_image,magscl(map1kp.data,min=-50,max=50)

setcolors,/sys,/sil

contour,datsm10,level=0,/over,c_color=!red,thick=2
contour,datsm20,level=0,/over,c_color=!blue,thick=2





stop

end