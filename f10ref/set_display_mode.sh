#!/system/bin/sh

case `getprop sys.fb.bits` in
    32) osd_bits=32
    ;;

    *) osd_bits=16
    ;;
esac

if [ -e /dev/dvb0.frontend0 ]; then
    DVB_EXIST=yes
else
    DVB_EXIST=no
fi

case $(getprop ubootenv.var.outputmode) in 
    480p)
        if [ "$(getprop ubootenv.var.480poutputx)" = "" ] ; then 
            setprop ubootenv.var.480poutputx 20
            output480px=20
        else output480px=$(getprop ubootenv.var.480poutputx)
        fi
        if [ "$(getprop ubootenv.var.480poutputy)" = "" ] ; then 
            setprop ubootenv.var.480poutputy 10
            output480py=10
        else output480py=$(getprop ubootenv.var.480poutputy)
        fi
        if [ "$(getprop ubootenv.var.480poutputwidth)" = "" ] ; then 
            setprop ubootenv.var.480poutputwidth 720
            output480pwidth=720
        else output480pwidth=$(getprop ubootenv.var.480poutputwidth)
        fi
        if [ "$(getprop ubootenv.var.480poutputheight)" = "" ] ; then 
            setprop ubootenv.var.480poutputheight 480
            output480pheight=480
        else output480pheight=$(getprop ubootenv.var.480poutputheight)
        fi
        output480pheightd=$(($output480pheight * 2))
        
        fbset -fb /dev/graphics/fb0 -g $output480pwidth $output480pheight $output480pwidth $output480pheightd $osd_bits
        echo 480p > /sys/class/display/mode
        if [ $DVB_EXIST = yes ]; then
	          echo $output480px $output480py $output480pwidth $output480pheight $output480px $output480py 680 460 > /sys/class/display/axis
	      else
            echo $output480px $output480py $output480pwidth $output480pheight $output480px $output480py 18 18 > /sys/class/display/axis
        fi
        echo 20 10 > /sys/class/video/global_offset
        setprop ro.sf.lcd_density 200
    ;;
    
    480i)
        if [ "$(getprop ubootenv.var.480ioutputx)" = "" ] ; then 
            setprop ubootenv.var.480ioutputx 20
            output480ix=20
        else output480ix=$(getprop ubootenv.var.480ioutputx)
        fi
        if [ "$(getprop ubootenv.var.480ioutputy)" = "" ] ; then 
            setprop ubootenv.var.480ioutputy 10
            output480iy=10
        else output480iy=$(getprop ubootenv.var.480ioutputy)
        fi
        if [ "$(getprop ubootenv.var.480ioutputwidth)" = "" ] ; then 
            setprop ubootenv.var.480ioutputwidth 720
            output480iwidth=720
        else output480iwidth=$(getprop ubootenv.var.480ioutputwidth)
        fi
        if [ "$(getprop ubootenv.var.480ioutputheight)" = "" ] ; then 
            setprop ubootenv.var.480ioutputheight 480
            output480iheight=480
        else output480iheight=$(getprop ubootenv.var.480ioutputheight)
        fi
        output480iheightd=$(($output480iheight * 2))
        
        fbset -fb /dev/graphics/fb0 -g $output480iwidth $output480iheight $output480iwidth $output480iheightd $osd_bits
        echo 480i > /sys/class/display/mode       
        if [ $DVB_EXIST = yes ]; then
	          echo $output480ix $output480iy $output480iwidth $output480iheight $output480ix $output480iy 680 460 > /sys/class/display/axis
	      else
            echo $output480ix $output480iy $output480iwidth $output480iheight $output480ix $output480iy 18 18 > /sys/class/display/axis
        fi
        echo 20 10 > /sys/class/video/global_offset
        setprop ro.sf.lcd_density 200
    ;; 
       
    576p)
        if [ "$(getprop ubootenv.var.576poutputx)" = "" ] ; then 
            setprop ubootenv.var.576poutputx 20
            output576px=20
        else output576px=$(getprop ubootenv.var.576poutputx)
        fi
        if [ "$(getprop ubootenv.var.576poutputy)" = "" ] ; then 
            setprop ubootenv.var.576poutputy 10
            output576py=10
        else output576py=$(getprop ubootenv.var.576poutputy)    
        fi
        if [ "$(getprop ubootenv.var.576poutputwidth)" = "" ] ; then 
            setprop ubootenv.var.576poutputwidth 720
            output576pwidth=720
        else output576pwidth=$(getprop ubootenv.var.576poutputwidth)            
        fi
        if [ "$(getprop ubootenv.var.576poutputheight)" = "" ] ; then 
            setprop ubootenv.var.576poutputheight 576
            output576pheight=576
        else output576pheight=$(getprop ubootenv.var.576poutputheight)
        fi
        output576pheightd=$(($output576pheight * 2))
        
        fbset -fb /dev/graphics/fb0 -g $output576pwidth $output576pheight $output576pwidth $output576pheightd $osd_bits
        echo 576p > /sys/class/display/mode
        if [ $DVB_EXIST = yes ]; then
            echo $output576px $output576py $output576pwidth $output576pheight $output576px $output576py 680 556 > /sys/class/display/axis
	      else
            echo $output576px $output576py $output576pwidth $output576pheight $output576px $output576py 18 18 > /sys/class/display/axis
        fi
        echo 20 10 > /sys/class/video/global_offset
        setprop ro.sf.lcd_density 200
    ;;    
    
    576i)
        if [ "$(getprop ubootenv.var.576ioutputx)" = "" ] ; then 
            setprop ubootenv.var.576ioutputx 20
            output576ix=20
        else output576ix=$(getprop ubootenv.var.576ioutputx)
        fi
        if [ "$(getprop ubootenv.var.576ioutputy)" = "" ] ; then 
            setprop ubootenv.var.576ioutputy 10
            output576iy=10
        else output576iy=$(getprop ubootenv.var.576ioutputy)    
        fi
        if [ "$(getprop ubootenv.var.576ioutputwidth)" = "" ] ; then 
            setprop ubootenv.var.576ioutputwidth 720
            output576iwidth=720
        else output576iwidth=$(getprop ubootenv.var.576ioutputwidth)            
        fi
        if [ "$(getprop ubootenv.var.576ioutputheight)" = "" ] ; then 
            setprop ubootenv.var.576ioutputheight 576
            output576iheight=576
        else output576iheight=$(getprop ubootenv.var.576ioutputheight)
        fi
        output576iheightd=$(($output576iheight * 2))
          
        fbset -fb /dev/graphics/fb0 -g $output576iwidth $output576iheight $output576iwidth $output576iheightd $osd_bits
        echo 576i > /sys/class/display/mode
        if [ $DVB_EXIST = yes ]; then
            echo $output576ix $output576iy $output576iwidth $output576iheight $output576ix $output576iy 680 556 > /sys/class/display/axis
	      else
            echo $output576ix $output576iy $output576iwidth $output576iheight $output576ix $output576iy 18 18 > /sys/class/display/axis
        fi
        echo 20 10 > /sys/class/video/global_offset
        setprop ro.sf.lcd_density 200
    ;;        
    720p)
        if [ "$(getprop ubootenv.var.720poutputx)" = "" ] ; then 
            setprop ubootenv.var.720poutputx 30
            output720px=30
        else output720px=$(getprop ubootenv.var.720poutputx)
        fi
        if [ "$(getprop ubootenv.var.720poutputy)" = "" ] ; then 
            setprop ubootenv.var.720poutputy 15
            output720py=15
        else output720py=$(getprop ubootenv.var.720poutputy)
        fi
        if [ "$(getprop ubootenv.var.720poutputwidth)" = "" ] ; then 
            setprop ubootenv.var.720poutputwidth 1280
            output720pwidth=1280
        else output720pwidth=$(getprop ubootenv.var.720poutputwidth)
        fi
        if [ "$(getprop ubootenv.var.720poutputheight)" = "" ] ; then 
            setprop ubootenv.var.720poutputheight 720
            output720pheight=720
        else output720pheight=$(getprop ubootenv.var.720poutputheight)
        fi
        output720pheightd=$(($output720pheight * 2))
        
        fbset -fb /dev/graphics/fb0 -g $output720pwidth $output720pheight $output720pwidth $output720pheightd $osd_bits
        echo 720p > /sys/class/display/mode
        if [ $DVB_EXIST = yes ]; then
            echo $output720px $output720py $output720pwidth $output720pheight $output720px $output720py 1240 690 > /sys/class/display/axis
	      else
            echo $output720px $output720py $output720pwidth $output720pheight $output720px $output720py 18 18 > /sys/class/display/axis
        fi
        echo 20 15 > /sys/class/video/global_offset
        setprop ro.sf.lcd_density 240
    ;;

    1080p)
        if [ "$(getprop ubootenv.var.1080poutputx)" = "" ] ; then 
            setprop ubootenv.var.1080poutputx 20
            output1080px=20
        else output1080px=$(getprop ubootenv.var.1080poutputx)
        fi
        if [ "$(getprop ubootenv.var.1080poutputy)" = "" ] ; then 
            setprop ubootenv.var.1080poutputy 10
            output1080py=10
        else output1080py=$(getprop ubootenv.var.1080poutputy)
        fi
        if [ "$(getprop ubootenv.var.1080poutputwidth)" = "" ] ; then 
            setprop ubootenv.var.1080poutputwidth 1920
            output1080pwidth=1920
        else output1080pwidth=$(getprop ubootenv.var.1080poutputwidth)
        fi
        if [ "$(getprop ubootenv.var.1080poutputheight)" = "" ] ; then 
            setprop ubootenv.var.1080poutputheight 1080
            output1080pheight=1080
        else output1080pheight=$(getprop ubootenv.var.1080poutputheight)
        fi
        output1080pheightd=$(($output1080pheight * 2))

        fbset -fb /dev/graphics/fb0 -g $output1080pwidth $output1080pheight $output1080pwidth $output1080pheightd $osd_bits
        echo 1080p > /sys/class/display/mode
        if [ $DVB_EXIST = yes ]; then
            echo $output1080px $output1080py $output1080pwidth $output1080pheight $output1080px $output1080py 1880 1060 > /sys/class/display/axis
	      else
            echo $output1080px $output1080py $output1080pwidth $output1080pheight $output1080px $output1080py 18 18 > /sys/class/display/axis
        fi
        echo 20 10 > /sys/class/video/global_offset
        setprop ro.sf.lcd_density 320
    ;;

    1080i)
        if [ "$(getprop ubootenv.var.1080ioutputx)" = "" ] ; then 
            setprop ubootenv.var.1080ioutputx 20
            output1080ix=20
        else output1080ix=$(getprop ubootenv.var.1080ioutputx)
        fi
        if [ "$(getprop ubootenv.var.1080ioutputy)" = "" ] ; then 
            setprop ubootenv.var.1080ioutputy 10
            output1080iy=10
        else output1080iy=$(getprop ubootenv.var.1080ioutputy)
        fi
        if [ "$(getprop ubootenv.var.1080ioutputwidth)" = "" ] ; then 
            setprop ubootenv.var.1080ioutputwidth 1920
            output1080iwidth=1920
        else output1080iwidth=$(getprop ubootenv.var.1080ioutputwidth)
        fi
        if [ "$(getprop ubootenv.var.1080ioutputheight)" = "" ] ; then 
            setprop ubootenv.var.1080ioutputheight 1080
            output1080iheight=1080
        else output1080iheight=$(getprop ubootenv.var.1080ioutputheight)
        fi
        output1080iheightd=$(($output1080iheight * 2))
      
        fbset -fb /dev/graphics/fb0 -g $output1080iwidth $output1080iheight $output1080iwidth $output1080iheightd $osd_bits
        echo 1080i > /sys/class/display/mode
        if [ $DVB_EXIST = yes ]; then
            echo $output1080ix $output1080iy $output1080iwidth $output1080iheight $output1080ix $output1080iy 1880 1060 > /sys/class/display/axis
	      else
            echo $output1080ix $output1080iy $output1080iwidth $output1080iheight $output1080ix $output1080iy 18 18 > /sys/class/display/axis
        fi
        echo 20 10 > /sys/class/video/global_offset
        setprop ro.sf.lcd_density 320
    ;;   

    *)
        echo "Error: Un-supported display mode 720p"
        echo "       Default to 720p"
        if [ "$(getprop ubootenv.var.720poutputx)" = "" ] ; then 
            setprop ubootenv.var.720poutputx 40
            output720px=30
        else output720px=$(getprop ubootenv.var.720poutputx)
        fi
        if [ "$(getprop ubootenv.var.720poutputy)" = "" ] ; then 
            setprop ubootenv.var.720poutputy 15
            output720py=15
        else output720py=$(getprop ubootenv.var.720poutputy)
        fi
        if [ "$(getprop ubootenv.var.720poutputwidth)" = "" ] ; then 
            setprop ubootenv.var.720poutputwidth 1200
            output720pwidth=1280
        else output720pwidth=$(getprop ubootenv.var.720poutputwidth)
        fi
        if [ "$(getprop ubootenv.var.720poutputheight)" = "" ] ; then 
            setprop ubootenv.var.720poutputheight 690
            output720pheight=720
        else output720pheight=$(getprop ubootenv.var.720poutputheight)
        fi
        output720pheightd=$(($output720pheight * 2))
        
        fbset -fb /dev/graphics/fb0 -g $output720pwidth $output720pheight $output720pwidth $output720pheightd $osd_bits
        echo 720p > /sys/class/display/mode
        if [ $DVB_EXIST = yes ]; then
            echo $output720px $output720py $output720pwidth $output720pheight $output720px $output720py 1200 690 > /sys/class/display/axis
	      else
            echo $output720px $output720py $output720pwidth $output720pheight $output720px $output720py 18 18 > /sys/class/display/axis
        fi
	      echo 40 15 > /sys/class/video/global_offset
        setprop ro.sf.lcd_density 240
esac