# This script was written and developed by ABKGroup students at UCSD. However, the underlying commands and reports are copyrighted by Cadence.
# We thank Cadence for granting permission to share our research to help promote and foster the next generation of innovators.
set halo_width 11.0
set site_width 0.084
set ver_halo_width [expr $halo_width / 5.0]

set all_insts [dbGet top.insts]
set macro_name_list {  }
set cell_name_list {  }
set macro_orient_list {  }
set macro_lx_list {  }
set macro_ly_list {  }
set macro_ux_list {  }
set macro_uy_list {  }

foreach inst $all_insts {
    set inst_base [dbGet $inst.cell.baseClass]
    if { $inst_base == "block" } {
        lappend macro_name_list [dbGet $inst.name]
        lappend cell_name_list [dbGet $inst.cell.name]
        lappend macro_orient_list [dbGet $inst.orient]
        lappend macro_lx_list [dbGet $inst.box_llx]
        lappend macro_ly_list [dbGet $inst.box_lly]
        lappend macro_ux_list [dbGet $inst.box_urx] 
        lappend macro_uy_list [dbGet $inst.box_ury]
    }
}

### Create CutRow Command
set fp [open "cut_row.tcl" "w"]
set i 0
set num_macro [llength $macro_name_list]
while {$i < $num_macro} {
    set lx [lindex $macro_lx_list $i]
    set ly [lindex $macro_ly_list $i]
    set ux [lindex $macro_ux_list $i]
    set uy [lindex $macro_uy_list $i]
    set lx [expr $lx - $halo_width]
    set ly [expr $ly - $ver_halo_width]
    set ux [expr $ux + $halo_width]
    set uy [expr $uy + $ver_halo_width]
    set lx [expr floor($lx / $site_width / 2) * $site_width * 2 - $site_width]
    set ux [expr ceil($ux / $site_width / 2) * $site_width * 2 + $site_width]

    puts $fp "cutRow -site \$site  -area $lx $ly $ux $uy"

    incr i
}
close $fp



### Create Power Stripes for macros
set offset 0.3
set power_lx_list {  }
set power_ly_list {  }
set power_ux_list {  }
set power_uy_list {  }
set i 0
while {$i < $num_macro} {
    set lx [lindex $macro_lx_list $i]
    set ly [lindex $macro_ly_list $i]
    set ux [lindex $macro_ux_list $i]
    set uy [lindex $macro_uy_list $i]
    lappend power_lx_list [expr $lx + $offset]
    lappend power_ux_list [expr $ux - $offset]
    lappend power_ly_list [expr $ly + $offset]
    lappend power_uy_list [expr $uy - $offset]
    incr i
}

set fp [open "macro_power_routing.tcl" "w"]
puts $fp "setAddStripeMode -reset"
puts $fp "setAddStripeMode -stacked_via_bottom_layer C4 -stacked_via_top_layer C5"
puts $fp "addStripe -nets { VSS VDD  } -layer C5 \\"
puts $fp "  -area { \\"
set i 0
while {$i < $num_macro} {
    set lx [lindex $power_lx_list $i]
    set ly [lindex $power_ly_list $i]
    set ux [lindex $power_ux_list $i]
    set uy [lindex $power_uy_list $i]
    puts $fp "   {$lx $ly $ux $uy} \\"
    incr i
}
puts $fp " } \\"
puts $fp " -direction vertical \\"
#puts $fp " -ybottom_offset 0.0 -xleft_offset -0.0 -width 0.24 -spacing 0.76 -set_to_set_distance 2.0"
puts $fp " -ybottom_offset 1.0 -xleft_offset -1.0 -width 0.24 -spacing 0.76 -set_to_set_distance 8.0"
puts $fp "\n"
puts $fp "setAddStripeMode -stacked_via_bottom_layer C5 -stacked_via_top_layer K1"
puts $fp "addStripe -nets { VSS VDD  } -layer K1 \\"
puts $fp "  -area { \\"
set i 0
while {$i < $num_macro} {
    set lx [lindex $power_lx_list $i]
    set ly [lindex $power_ly_list $i]
    set ux [lindex $power_ux_list $i]
    set uy [lindex $power_uy_list $i]
    puts $fp "   {$lx $ly $ux $uy} \\"
    incr i
}
puts $fp " } \\"
puts $fp " -direction horizontal \\"
puts $fp " -ybottom_offset 0.0 -xleft_offset -0.0 -width 0.284 -spacing 0.996 -set_to_set_distance 10.24"
puts $fp "\n"
puts $fp "setAddStripeMode -stacked_via_bottom_layer K1 -stacked_via_top_layer K2"
puts $fp "addStripe -nets { VSS VDD  } -layer K2 \\"
puts $fp "  -area { \\"
set i 0
while {$i < $num_macro} {
    set lx [lindex $power_lx_list $i]
    set ly [lindex $power_ly_list $i]
    set ux [lindex $power_ux_list $i]
    set uy [lindex $power_uy_list $i]
    puts $fp "   {$lx $ly $ux $uy} \\"
    incr i
}
puts $fp " } \\"
puts $fp " -direction vertical \\"
puts $fp " -ybottom_offset 0.0 -xleft_offset -0.0 -width 0.284 -spacing 0.996 -set_to_set_distance 10.24"
puts $fp "\n"

close $fp



