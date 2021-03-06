#!/system/bin/sh

case `getprop sys.fb.bits` in
    32) osd_bits=32
    ;;

    *) osd_bits=16
    ;;
esac

#if [ -e /dev/dvb0.frontend0 ]; then
#    DVB_EXIST=yes
#else
    DVB_EXIST=no
#fi
outputmode=$(getprop ubootenv.var.outputmode)
scalemode=$(getprop ro.platform.has.1080scale)


if [ "$(getprop ro.amlogic.has.CvbsOutput)" = "true" ]; then
	cvbsmode=$(getprop ubootenv.var.cvbsmode)

	if [ "$cvbsmode" = "480cvbs" ]; then
		echo null > /sys/class/display2/mode
		echo 480cvbs > /sys/class/display2/mode 
		echo 1 > /sys/class/video2/screen_mode
	elif [ "$cvbsmode" = "576cvbs" ]; then
			
			echo null > /sys/class/display2/mode
			echo 576cvbs > /sys/class/display2/mode 
			echo 1 > /sys/class/video2/screen_mode
	elif [ "$outputmode" = "576i" -o "$outputmode" = "480i" ]; then
				echo null > /sys/class/display2/mode
				setprop ubootenv.var.cvbsmode null
	else
				echo null > /sys/class/display2/mode
				echo 480cvbs > /sys/class/display2/mode 
				echo 1 > /sys/class/video2/screen_mode
				setprop ubootenv.var.cvbsmode 480cvbs
	fi

	if [ "$outputmode" = "1080p" ] ; then
	    echo 960  > /sys/module/amvideo2/parameters/clone_frame_scale_width
	else
		echo 0  > /sys/module/amvideo2/parameters/clone_frame_scale_width
	fi
fi


if [ "$scalemode" = "2" ] ; then
    fbset -fb /dev/graphics/fb0 -g 1280 1080 1280 2160 $osd_bits
    echo 0 0 1279 719 > /sys/class/graphics/fb0/free_scale_axis
    echo 0 0 1279 719 > /sys/class/video/axis
    echo 1 > /sys/class/ppmgr/ppscaler
    setprop ro.sf.lcd_density 160
    setprop qemu.sf.lcd_density 160
fi

case $outputmode in 
    480p)
        if [ "$(getprop ubootenv.var.480poutputx)" = "" ] ; then 
            output480px=0
        else output480px=$(getprop ubootenv.var.480poutputx)
        fi
        if [ "$(getprop ubootenv.var.480poutputy)" = "" ] ; then 
            output480py=0
        else output480py=$(getprop ubootenv.var.480poutputy)
        fi
        if [ "$(getprop ubootenv.var.480poutputwidth)" = "" ] ; then 
            output480pwidth=720
        else output480pwidth=$(getprop ubootenv.var.480poutputwidth)
        fi
        if [ "$(getprop ubootenv.var.480poutputheight)" = "" ] ; then 
            output480pheight=480
        else output480pheight=$(getprop ubootenv.var.480poutputheight)
        fi
        
        if [ "$scalemode" = "2" ] ; then
            echo 480p > /sys/class/display/mode
            busybox echo $output480px $output480py $(($output480pwidth + $output480px - 1)) $(($output480pheight + $output480py - 1)) 0 > /sys/class/ppmgr/ppscaler_rect
            sleep 1
            echo 1 > /sys/class/graphics/fb0/free_scale
            echo 1 > /sys/class/graphics/fb1/free_scale
        else
            output480pheightd=$(($output480pheight * 2))
            fbset -fb /dev/graphics/fb0 -g $output480pwidth $output480pheight $output480pwidth $output480pheightd $osd_bits
            echo 480p > /sys/class/display/mode
            if [ $DVB_EXIST = yes ]; then
    	          echo $output480px $output480py $output480pwidth $output480pheight $output480px $output480py 680 460 > /sys/class/display/axis
    	      else
                echo $output480px $output480py $output480pwidth $output480pheight $output480px $output480py 18 18 > /sys/class/display/axis
            fi
            echo $output480px $output480py > /sys/class/video/global_offset
            setprop ro.sf.lcd_density 160
            setprop qemu.sf.lcd_density 160
        fi
    ;;
    
    480i)
        if [ "$(getprop ubootenv.var.480ioutputx)" = "" ] ; then 
            output480ix=0
        else output480ix=$(getprop ubootenv.var.480ioutputx)
        fi
        if [ "$(getprop ubootenv.var.480ioutputy)" = "" ] ; then 
            output480iy=0
        else output480iy=$(getprop ubootenv.var.480ioutputy)
        fi
        if [ "$(getprop ubootenv.var.480ioutputwidth)" = "" ] ; then 
            output480iwidth=720
        else output480iwidth=$(getprop ubootenv.var.480ioutputwidth)
        fi
        if [ "$(getprop ubootenv.var.480ioutputheight)" = "" ] ; then 
            output480iheight=480
        else output480iheight=$(getprop ubootenv.var.480ioutputheight)
        fi
        
        if [ "$scalemode" = "2" ] ; then
            echo 480i > /sys/class/display/mode
            busybox echo $output480ix $output480iy $(($output480iwidth + $output480ix - 1)) $(($output480iheight + $output480iy - 1)) 0 > /sys/class/ppmgr/ppscaler_rect
            sleep 1
            echo 1 > /sys/class/graphics/fb0/free_scale
            echo 1 > /sys/class/graphics/fb1/free_scale
        else
            output480iheightd=$(($output480iheight * 2))
            fbset -fb /dev/graphics/fb0 -g $output480iwidth $output480iheight $output480iwidth $output480iheightd $osd_bits
            echo 480i > /sys/class/display/mode       
            if [ $DVB_EXIST = yes ]; then
    	          echo $output480ix $output480iy $output480iwidth $output480iheight $output480ix $output480iy 680 460 > /sys/class/display/axis
    	      else
                echo $output480ix $output480iy $output480iwidth $output480iheight $output480ix $output480iy 18 18 > /sys/class/display/axis
            fi
            echo $output480ix $output480iy > /sys/class/video/global_offset
            setprop ro.sf.lcd_density 160
            setprop qemu.sf.lcd_density 160
        fi
    ;; 
       
    576p)
        if [ "$(getprop ubootenv.var.576poutputx)" = "" ] ; then 
            output576px=0
        else output576px=$(getprop ubootenv.var.576poutputx)
        fi
        if [ "$(getprop ubootenv.var.576poutputy)" = "" ] ; then 
            output576py=0
        else output576py=$(getprop ubootenv.var.576poutputy)    
        fi
        if [ "$(getprop ubootenv.var.576poutputwidth)" = "" ] ; then 
            output576pwidth=720
        else output576pwidth=$(getprop ubootenv.var.576poutputwidth)            
        fi
        if [ "$(getprop ubootenv.var.576poutputheight)" = "" ] ; then 
            output576pheight=576
        else output576pheight=$(getprop ubootenv.var.576poutputheight)
        fi
        
        if [ "$scalemode" = "2" ] ; then
            echo 576p > /sys/class/display/mode
            busybox echo $output576px $output576py $(($output576pwidth + $output576px - 1)) $(($output576pheight + $output576py - 1)) 0 > /sys/class/ppmgr/ppscaler_rect
            sleep 1
            echo 1 > /sys/class/graphics/fb0/free_scale
            echo 1 > /sys/class/graphics/fb1/free_scale
        else
            output576pheightd=$(($output576pheight * 2))
            fbset -fb /dev/graphics/fb0 -g $output576pwidth $output576pheight $output576pwidth $output576pheightd $osd_bits
            echo 576p > /sys/class/display/mode
            if [ $DVB_EXIST = yes ]; then
                echo $output576px $output576py $output576pwidth $output576pheight $output576px $output576py 680 556 > /sys/class/display/axis
    	      else
                echo $output576px $output576py $output576pwidth $output576pheight $output576px $output576py 18 18 > /sys/class/display/axis
            fi
            echo $output576px $output576py > /sys/class/video/global_offset
            setprop ro.sf.lcd_density 160
            setprop qemu.sf.lcd_density 160
        fi
    ;;    
    
    576i)
        if [ "$(getprop ubootenv.var.576ioutputx)" = "" ] ; then 
            output576ix=0
        else output576ix=$(getprop ubootenv.var.576ioutputx)
        fi
        if [ "$(getprop ubootenv.var.576ioutputy)" = "" ] ; then 
            output576iy=0
        else output576iy=$(getprop ubootenv.var.576ioutputy)    
        fi
        if [ "$(getprop ubootenv.var.576ioutputwidth)" = "" ] ; then 
            output576iwidth=720
        else output576iwidth=$(getprop ubootenv.var.576ioutputwidth)            
        fi
        if [ "$(getprop ubootenv.var.576ioutputheight)" = "" ] ; then 
            output576iheight=576
        else output576iheight=$(getprop ubootenv.var.576ioutputheight)
        fi
        
        if [ "$scalemode" = "2" ] ; then
            echo 576i > /sys/class/display/mode
            busybox echo $output576ix $output576iy $(($output576iwidth + $output576ix - 1)) $(($output576iheight + $output576iy - 1)) 0 > /sys/class/ppmgr/ppscaler_rect
            sleep 1
            echo 1 > /sys/class/graphics/fb0/free_scale
            echo 1 > /sys/class/graphics/fb1/free_scale
        else
            output576iheightd=$(($output576iheight * 2))
            fbset -fb /dev/graphics/fb0 -g $output576iwidth $output576iheight $output576iwidth $output576iheightd $osd_bits
            echo 576i > /sys/class/display/mode
            if [ $DVB_EXIST = yes ]; then
                echo $output576ix $output576iy $output576iwidth $output576iheight $output576ix $output576iy 680 556 > /sys/class/display/axis
    	      else
                echo $output576ix $output576iy $output576iwidth $output576iheight $output576ix $output576iy 18 18 > /sys/class/display/axis
            fi
            echo $output576ix $output576iy > /sys/class/video/global_offset
            setprop ro.sf.lcd_density 160
            setprop qemu.sf.lcd_density 160
        fi
    ;;        
    720p)
        if [ "$(getprop ubootenv.var.720poutputx)" = "" ] ; then 
            output720px=0
        else output720px=$(getprop ubootenv.var.720poutputx)
        fi
        if [ "$(getprop ubootenv.var.720poutputy)" = "" ] ; then 
            output720py=0
        else output720py=$(getprop ubootenv.var.720poutputy)
        fi
        if [ "$(getprop ubootenv.var.720poutputwidth)" = "" ] ; then 
            output720pwidth=1280
        else output720pwidth=$(getprop ubootenv.var.720poutputwidth)
        fi
        if [ "$(getprop ubootenv.var.720poutputheight)" = "" ] ; then 
            output720pheight=720
        else output720pheight=$(getprop ubootenv.var.720poutputheight)
        fi
        output720pheightd=$(($output720pheight * 2))
        
        if [ "$scalemode" = "1" -o "$scalemode" = "2" ] ; then
            if [ "$(getprop ubootenv.var.defaulttvfrequency)" = "50Hz" ] ; then
                echo 720p50hz > /sys/class/display/mode
            else
                echo 720p > /sys/class/display/mode
            fi
            busybox echo $output720px $output720py $(($output720pwidth + $output720px - 1)) $(($output720pheight + $output720py - 1)) 0 > /sys/class/ppmgr/ppscaler_rect
            sleep 1
            echo 1 > /sys/class/graphics/fb0/free_scale
            echo 1 > /sys/class/graphics/fb1/free_scale
        else
            fbset -fb /dev/graphics/fb0 -g $output720pwidth $output720pheight $output720pwidth $output720pheightd $osd_bits
            if [ "$(getprop ubootenv.var.defaulttvfrequency)" = "50Hz" ] ; then
                echo 720p50hz > /sys/class/display/mode
            else
                echo 720p > /sys/class/display/mode
            fi
            if [ $DVB_EXIST = yes ]; then
                echo $output720px $output720py $output720pwidth $output720pheight $output720px $output720py 1240 690 > /sys/class/display/axis
    	      else
                echo $output720px $output720py $output720pwidth $output720pheight $output720px $output720py 18 18 > /sys/class/display/axis
            fi
            echo $output720px $output720py > /sys/class/video/global_offset
            setprop ro.sf.lcd_density 160
            setprop qemu.sf.lcd_density 160
        fi
    ;;

    1080p)
        if [ "$(getprop ubootenv.var.1080poutputx)" = "" ] ; then 
            output1080px=0
        else output1080px=$(getprop ubootenv.var.1080poutputx)
        fi
        if [ "$(getprop ubootenv.var.1080poutputy)" = "" ] ; then 
            output1080py=0
        else output1080py=$(getprop ubootenv.var.1080poutputy)
        fi
        if [ "$(getprop ubootenv.var.1080poutputwidth)" = "" ] ; then 
            output1080pwidth=1920
        else output1080pwidth=$(getprop ubootenv.var.1080poutputwidth)
        fi
        if [ "$(getprop ubootenv.var.1080poutputheight)" = "" ] ; then 
            output1080pheight=1080
        else output1080pheight=$(getprop ubootenv.var.1080poutputheight)
        fi
        
        if [ "$scalemode" = "1" -o "$scalemode" = "2" ] ; then
            if [ "$(getprop ubootenv.var.defaulttvfrequency)" = "50Hz" ] ; then
                echo 1080p50hz > /sys/class/display/mode
            else
                echo 1080p > /sys/class/display/mode
            fi
            busybox echo $output1080px $output1080py $(($output1080pwidth + $output1080px - 1)) $(($output1080pheight + $output1080py - 1)) 0 > /sys/class/ppmgr/ppscaler_rect
            sleep 1
            echo 1 > /sys/class/graphics/fb0/free_scale
            echo 1 > /sys/class/graphics/fb1/free_scale
        else
            output1080pheightd=$(($output1080pheight * 2))
            fbset -fb /dev/graphics/fb0 -g $output1080pwidth $output1080pheight $output1080pwidth $output1080pheightd $osd_bits
            if [ "$(getprop ubootenv.var.defaulttvfrequency)" = "50Hz" ] ; then
                echo 1080p50hz > /sys/class/display/mode
            else
                echo 1080p > /sys/class/display/mode
            fi
            if [ $DVB_EXIST = yes ]; then
                echo $output1080px $output1080py $output1080pwidth $output1080pheight $output1080px $output1080py 1880 1060 > /sys/class/display/axis
    	      else
                echo $output1080px $output1080py $output1080pwidth $output1080pheight $output1080px $output1080py 18 18 > /sys/class/display/axis
            fi
            echo $output1080px $output1080py > /sys/class/video/global_offset
            setprop ro.sf.lcd_density 160
            setprop qemu.sf.lcd_density 160
        fi
    ;;

    1080i)
        if [ "$(getprop ubootenv.var.1080ioutputx)" = "" ] ; then 
            output1080ix=0
        else output1080ix=$(getprop ubootenv.var.1080ioutputx)
        fi
        if [ "$(getprop ubootenv.var.1080ioutputy)" = "" ] ; then 
            output1080iy=0
        else output1080iy=$(getprop ubootenv.var.1080ioutputy)
        fi
        if [ "$(getprop ubootenv.var.1080ioutputwidth)" = "" ] ; then 
            output1080iwidth=1920
        else output1080iwidth=$(getprop ubootenv.var.1080ioutputwidth)
        fi
        if [ "$(getprop ubootenv.var.1080ioutputheight)" = "" ] ; then 
            output1080iheight=1080
        else output1080iheight=$(getprop ubootenv.var.1080ioutputheight)
        fi
        
        if [ "$scalemode" = "1" -o "$scalemode" = "2" ] ; then
            if [ "$(getprop ubootenv.var.defaulttvfrequency)" = "50Hz" ] ; then
                echo 1080i50hz > /sys/class/display/mode
            else
                echo 1080i > /sys/class/display/mode
            fi
            busybox echo $output1080ix $output1080iy $(($output1080iwidth + $output1080ix - 1)) $(($output1080iheight + $output1080iy - 1)) 0 > /sys/class/ppmgr/ppscaler_rect
            sleep 1
            echo 1 > /sys/class/graphics/fb0/free_scale
            echo 1 > /sys/class/graphics/fb1/free_scale
        else
            output1080iheightd=$(($output1080iheight * 2))
            fbset -fb /dev/graphics/fb0 -g $output1080iwidth $output1080iheight $output1080iwidth $output1080iheightd $osd_bits
            if [ "$(getprop ubootenv.var.defaulttvfrequency)" = "50Hz" ] ; then
                echo 1080i50hz > /sys/class/display/mode
            else
                echo 1080i > /sys/class/display/mode
            fi
            if [ $DVB_EXIST = yes ]; then
                echo $output1080ix $output1080iy $output1080iwidth $output1080iheight $output1080ix $output1080iy 1880 1060 > /sys/class/display/axis
    	      else
                echo $output1080ix $output1080iy $output1080iwidth $output1080iheight $output1080ix $output1080iy 18 18 > /sys/class/display/axis
            fi
            echo $output1080ix $output1080iy > /sys/class/video/global_offset
            setprop ro.sf.lcd_density 160
            setprop qemu.sf.lcd_density 160
        fi
    ;;   

    *)
        echo "Error: Un-supported display mode 720p"
        echo "       Default to 720p"
        if [ "$(getprop ubootenv.var.720poutputx)" = "" ] ; then 
            output720px=0
        else output720px=$(getprop ubootenv.var.720poutputx)
        fi
        if [ "$(getprop ubootenv.var.720poutputy)" = "" ] ; then 
            output720py=0
        else output720py=$(getprop ubootenv.var.720poutputy)
        fi
        if [ "$(getprop ubootenv.var.720poutputwidth)" = "" ] ; then 
            output720pwidth=1280
        else output720pwidth=$(getprop ubootenv.var.720poutputwidth)
        fi
        if [ "$(getprop ubootenv.var.720poutputheight)" = "" ] ; then 
            output720pheight=720
        else output720pheight=$(getprop ubootenv.var.720poutputheight)
        fi
        output720pheightd=$(($output720pheight * 2))
        
        if [ "$scalemode" = "1" -o "$scalemode" = "2" ] ; then
            if [ "$(getprop ubootenv.var.defaulttvfrequency)" = "50Hz" ] ; then
                echo 720p50hz > /sys/class/display/mode
            else
                echo 720p > /sys/class/display/mode
            fi
            busybox echo $output720px $output720py $(($output720pwidth + $output720px - 1)) $(($output720pheight + $output720py - 1)) 0 > /sys/class/ppmgr/ppscaler_rect
            sleep 1
            echo 1 > /sys/class/graphics/fb0/free_scale
            echo 1 > /sys/class/graphics/fb1/free_scale
        else
            fbset -fb /dev/graphics/fb0 -g $output720pwidth $output720pheight $output720pwidth $output720pheightd $osd_bits
            if [ "$(getprop ubootenv.var.defaulttvfrequency)" = "50Hz" ] ; then
                echo 720p50hz > /sys/class/display/mode
            else
                echo 720p > /sys/class/display/mode
            fi
            if [ $DVB_EXIST = yes ]; then
                echo $output720px $output720py $output720pwidth $output720pheight $output720px $output720py 1240 690 > /sys/class/display/axis
    	      else
                echo $output720px $output720py $output720pwidth $output720pheight $output720px $output720py 18 18 > /sys/class/display/axis
            fi
            echo $output720px $output720py > /sys/class/video/global_offset
            setprop ro.sf.lcd_density 160
            setprop qemu.sf.lcd_density 160
        fi
esac

if [ "$(getprop ubootenv.var.digitaudiooutput)" = "RAW" ] ; then
    echo 1 > /sys/class/audiodsp/digital_raw
else
    echo 0 > /sys/class/audiodsp/digital_raw
fi

if [ "$scalemode" = "2" ] ; then
    if [ $DVB_EXIST = yes ]; then
        echo 0 0 1280 720 0 0 1240 690 > /sys/class/display/axis
    else
        echo 0 0 1280 720 0 0 18 18 > /sys/class/display/axis
    fi
fi

echo 1 > /sys/class/graphics/fb1/blank
fbset -fb /dev/graphics/fb1 -g 32 32 32 32 $osd_bits
echo 1 > /sys/class/graphics/fb1/blank
