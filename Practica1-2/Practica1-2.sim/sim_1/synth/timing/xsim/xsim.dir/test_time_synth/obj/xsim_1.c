/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
IKI_DLLESPEC extern void execute_2(char*, char *);
IKI_DLLESPEC extern void execute_3(char*, char *);
IKI_DLLESPEC extern void execute_4(char*, char *);
IKI_DLLESPEC extern void execute_5(char*, char *);
IKI_DLLESPEC extern void execute_6(char*, char *);
IKI_DLLESPEC extern void execute_7(char*, char *);
IKI_DLLESPEC extern void execute_8(char*, char *);
IKI_DLLESPEC extern void execute_9(char*, char *);
IKI_DLLESPEC extern void execute_10(char*, char *);
IKI_DLLESPEC extern void execute_11(char*, char *);
IKI_DLLESPEC extern void execute_60(char*, char *);
IKI_DLLESPEC extern void execute_61(char*, char *);
IKI_DLLESPEC extern void execute_29(char*, char *);
IKI_DLLESPEC extern void execute_170(char*, char *);
IKI_DLLESPEC extern void execute_171(char*, char *);
IKI_DLLESPEC extern void execute_172(char*, char *);
IKI_DLLESPEC extern void execute_173(char*, char *);
IKI_DLLESPEC extern void execute_174(char*, char *);
IKI_DLLESPEC extern void execute_175(char*, char *);
IKI_DLLESPEC extern void execute_31(char*, char *);
IKI_DLLESPEC extern void execute_64(char*, char *);
IKI_DLLESPEC extern void execute_37(char*, char *);
IKI_DLLESPEC extern void execute_67(char*, char *);
IKI_DLLESPEC extern void execute_68(char*, char *);
IKI_DLLESPEC extern void execute_69(char*, char *);
IKI_DLLESPEC extern void execute_42(char*, char *);
IKI_DLLESPEC extern void execute_74(char*, char *);
IKI_DLLESPEC extern void execute_75(char*, char *);
IKI_DLLESPEC extern void execute_76(char*, char *);
IKI_DLLESPEC extern void execute_77(char*, char *);
IKI_DLLESPEC extern void execute_78(char*, char *);
IKI_DLLESPEC extern void execute_79(char*, char *);
IKI_DLLESPEC extern void execute_80(char*, char *);
IKI_DLLESPEC extern void execute_81(char*, char *);
IKI_DLLESPEC extern void execute_73(char*, char *);
IKI_DLLESPEC extern void vlog_const_rhs_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
IKI_DLLESPEC extern void execute_162(char*, char *);
IKI_DLLESPEC extern void execute_163(char*, char *);
IKI_DLLESPEC extern void execute_164(char*, char *);
IKI_DLLESPEC extern void execute_165(char*, char *);
IKI_DLLESPEC extern void execute_166(char*, char *);
IKI_DLLESPEC extern void execute_167(char*, char *);
IKI_DLLESPEC extern void execute_168(char*, char *);
IKI_DLLESPEC extern void execute_169(char*, char *);
IKI_DLLESPEC extern void execute_48(char*, char *);
IKI_DLLESPEC extern void execute_86(char*, char *);
IKI_DLLESPEC extern void execute_87(char*, char *);
IKI_DLLESPEC extern void execute_88(char*, char *);
IKI_DLLESPEC extern void execute_89(char*, char *);
IKI_DLLESPEC extern void execute_85(char*, char *);
IKI_DLLESPEC extern void execute_50(char*, char *);
IKI_DLLESPEC extern void execute_52(char*, char *);
IKI_DLLESPEC extern void execute_53(char*, char *);
IKI_DLLESPEC extern void execute_90(char*, char *);
IKI_DLLESPEC extern void execute_91(char*, char *);
IKI_DLLESPEC extern void execute_92(char*, char *);
IKI_DLLESPEC extern void vlog_simple_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
IKI_DLLESPEC extern void execute_94(char*, char *);
IKI_DLLESPEC extern void execute_95(char*, char *);
IKI_DLLESPEC extern void execute_96(char*, char *);
IKI_DLLESPEC extern void execute_97(char*, char *);
IKI_DLLESPEC extern void execute_98(char*, char *);
IKI_DLLESPEC extern void execute_99(char*, char *);
IKI_DLLESPEC extern void execute_100(char*, char *);
IKI_DLLESPEC extern void execute_101(char*, char *);
IKI_DLLESPEC extern void execute_102(char*, char *);
IKI_DLLESPEC extern void execute_103(char*, char *);
IKI_DLLESPEC extern void execute_104(char*, char *);
IKI_DLLESPEC extern void execute_106(char*, char *);
IKI_DLLESPEC extern void execute_107(char*, char *);
IKI_DLLESPEC extern void execute_108(char*, char *);
IKI_DLLESPEC extern void execute_109(char*, char *);
IKI_DLLESPEC extern void execute_111(char*, char *);
IKI_DLLESPEC extern void execute_112(char*, char *);
IKI_DLLESPEC extern void execute_113(char*, char *);
IKI_DLLESPEC extern void execute_114(char*, char *);
IKI_DLLESPEC extern void vlog_timingcheck_execute_0(char*, char*, char*);
IKI_DLLESPEC extern void timing_checker_condition_m_f1d6f043_953ebd85_1(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_f1d6f043_953ebd85_2(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_f1d6f043_953ebd85_3(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_f1d6f043_953ebd85_4(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_f1d6f043_953ebd85_5(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_f1d6f043_953ebd85_6(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_f1d6f043_953ebd85_7(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_f1d6f043_953ebd85_8(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_f1d6f043_953ebd85_9(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_f1d6f043_953ebd85_10(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_f1d6f043_953ebd85_11(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_f1d6f043_953ebd85_12(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_f1d6f043_953ebd85_13(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_f1d6f043_953ebd85_14(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_f1d6f043_953ebd85_15(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_f1d6f043_953ebd85_16(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_f1d6f043_953ebd85_17(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_f1d6f043_953ebd85_18(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_f1d6f043_953ebd85_19(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_f1d6f043_953ebd85_20(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_f1d6f043_953ebd85_21(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_f1d6f043_953ebd85_22(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_f1d6f043_953ebd85_23(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_f1d6f043_953ebd85_24(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_f1d6f043_953ebd85_25(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_f1d6f043_953ebd85_26(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_f1d6f043_953ebd85_27(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_f1d6f043_953ebd85_28(char*, char *);
IKI_DLLESPEC extern void execute_137(char*, char *);
IKI_DLLESPEC extern void execute_144(char*, char *);
IKI_DLLESPEC extern void execute_145(char*, char *);
IKI_DLLESPEC extern void execute_146(char*, char *);
IKI_DLLESPEC extern void execute_115(char*, char *);
IKI_DLLESPEC extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
IKI_DLLESPEC extern void transaction_63(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_64(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_65(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_66(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
IKI_DLLESPEC extern void transaction_68(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_69(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_70(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_71(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_72(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_73(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_74(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_75(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_76(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_77(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_78(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_79(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_80(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_94(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_95(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_96(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_97(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_98(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_99(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_100(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_101(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_102(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_103(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_104(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_105(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[141] = {(funcp)execute_2, (funcp)execute_3, (funcp)execute_4, (funcp)execute_5, (funcp)execute_6, (funcp)execute_7, (funcp)execute_8, (funcp)execute_9, (funcp)execute_10, (funcp)execute_11, (funcp)execute_60, (funcp)execute_61, (funcp)execute_29, (funcp)execute_170, (funcp)execute_171, (funcp)execute_172, (funcp)execute_173, (funcp)execute_174, (funcp)execute_175, (funcp)execute_31, (funcp)execute_64, (funcp)execute_37, (funcp)execute_67, (funcp)execute_68, (funcp)execute_69, (funcp)execute_42, (funcp)execute_74, (funcp)execute_75, (funcp)execute_76, (funcp)execute_77, (funcp)execute_78, (funcp)execute_79, (funcp)execute_80, (funcp)execute_81, (funcp)execute_73, (funcp)vlog_const_rhs_process_execute_0_fast_no_reg_no_agg, (funcp)execute_162, (funcp)execute_163, (funcp)execute_164, (funcp)execute_165, (funcp)execute_166, (funcp)execute_167, (funcp)execute_168, (funcp)execute_169, (funcp)execute_48, (funcp)execute_86, (funcp)execute_87, (funcp)execute_88, (funcp)execute_89, (funcp)execute_85, (funcp)execute_50, (funcp)execute_52, (funcp)execute_53, (funcp)execute_90, (funcp)execute_91, (funcp)execute_92, (funcp)vlog_simple_process_execute_0_fast_no_reg_no_agg, (funcp)execute_94, (funcp)execute_95, (funcp)execute_96, (funcp)execute_97, (funcp)execute_98, (funcp)execute_99, (funcp)execute_100, (funcp)execute_101, (funcp)execute_102, (funcp)execute_103, (funcp)execute_104, (funcp)execute_106, (funcp)execute_107, (funcp)execute_108, (funcp)execute_109, (funcp)execute_111, (funcp)execute_112, (funcp)execute_113, (funcp)execute_114, (funcp)vlog_timingcheck_execute_0, (funcp)timing_checker_condition_m_f1d6f043_953ebd85_1, (funcp)timing_checker_condition_m_f1d6f043_953ebd85_2, (funcp)timing_checker_condition_m_f1d6f043_953ebd85_3, (funcp)timing_checker_condition_m_f1d6f043_953ebd85_4, (funcp)timing_checker_condition_m_f1d6f043_953ebd85_5, (funcp)timing_checker_condition_m_f1d6f043_953ebd85_6, (funcp)timing_checker_condition_m_f1d6f043_953ebd85_7, (funcp)timing_checker_condition_m_f1d6f043_953ebd85_8, (funcp)timing_checker_condition_m_f1d6f043_953ebd85_9, (funcp)timing_checker_condition_m_f1d6f043_953ebd85_10, (funcp)timing_checker_condition_m_f1d6f043_953ebd85_11, (funcp)timing_checker_condition_m_f1d6f043_953ebd85_12, (funcp)timing_checker_condition_m_f1d6f043_953ebd85_13, (funcp)timing_checker_condition_m_f1d6f043_953ebd85_14, (funcp)timing_checker_condition_m_f1d6f043_953ebd85_15, (funcp)timing_checker_condition_m_f1d6f043_953ebd85_16, (funcp)timing_checker_condition_m_f1d6f043_953ebd85_17, (funcp)timing_checker_condition_m_f1d6f043_953ebd85_18, (funcp)timing_checker_condition_m_f1d6f043_953ebd85_19, (funcp)timing_checker_condition_m_f1d6f043_953ebd85_20, (funcp)timing_checker_condition_m_f1d6f043_953ebd85_21, (funcp)timing_checker_condition_m_f1d6f043_953ebd85_22, (funcp)timing_checker_condition_m_f1d6f043_953ebd85_23, (funcp)timing_checker_condition_m_f1d6f043_953ebd85_24, (funcp)timing_checker_condition_m_f1d6f043_953ebd85_25, (funcp)timing_checker_condition_m_f1d6f043_953ebd85_26, (funcp)timing_checker_condition_m_f1d6f043_953ebd85_27, (funcp)timing_checker_condition_m_f1d6f043_953ebd85_28, (funcp)execute_137, (funcp)execute_144, (funcp)execute_145, (funcp)execute_146, (funcp)execute_115, (funcp)vlog_transfunc_eventcallback, (funcp)transaction_63, (funcp)transaction_64, (funcp)transaction_65, (funcp)transaction_66, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_68, (funcp)transaction_69, (funcp)transaction_70, (funcp)transaction_71, (funcp)transaction_72, (funcp)transaction_73, (funcp)transaction_74, (funcp)transaction_75, (funcp)transaction_76, (funcp)transaction_77, (funcp)transaction_78, (funcp)transaction_79, (funcp)transaction_80, (funcp)transaction_94, (funcp)transaction_95, (funcp)transaction_96, (funcp)transaction_97, (funcp)transaction_98, (funcp)transaction_99, (funcp)transaction_100, (funcp)transaction_101, (funcp)transaction_102, (funcp)transaction_103, (funcp)transaction_104, (funcp)transaction_105};
const int NumRelocateId= 141;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/test_time_synth/xsim.reloc",  (void **)funcTab, 141);
	iki_vhdl_file_variable_register(dp + 40248);
	iki_vhdl_file_variable_register(dp + 40304);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/test_time_synth/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/test_time_synth/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 47928, dp + 48592, 0, 2, 0, 2, 3, 1);
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/test_time_synth/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/test_time_synth/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/test_time_synth/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, (void*)0, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
