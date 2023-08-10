transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/media/gdo/Samsung_Ex/quartusprimeprojects {/media/gdo/Samsung_Ex/quartusprimeprojects/stack_shift.sv}

vlog -sv -work work +incdir+/media/gdo/Samsung_Ex/quartusprimeprojects {/media/gdo/Samsung_Ex/quartusprimeprojects/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
