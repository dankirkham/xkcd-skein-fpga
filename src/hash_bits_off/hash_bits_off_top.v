module hash_bits_off_top (
	input [1023:0] hash_xor_i,
	output [9:0] hash_bits_off_o
);

wire [767:0] stage1_output;
wire [511:0] stage2_output;
wire [319:0] stage3_output;

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_0 (
	.four_bits_i(hash_xor_i[3:0]),
	.three_bits_o(stage1_output[2:0])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_1 (
	.four_bits_i(hash_xor_i[7:4]),
	.three_bits_o(stage1_output[5:3])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_2 (
	.four_bits_i(hash_xor_i[11:8]),
	.three_bits_o(stage1_output[8:6])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_3 (
	.four_bits_i(hash_xor_i[15:12]),
	.three_bits_o(stage1_output[11:9])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_4 (
	.four_bits_i(hash_xor_i[19:16]),
	.three_bits_o(stage1_output[14:12])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_5 (
	.four_bits_i(hash_xor_i[23:20]),
	.three_bits_o(stage1_output[17:15])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_6 (
	.four_bits_i(hash_xor_i[27:24]),
	.three_bits_o(stage1_output[20:18])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_7 (
	.four_bits_i(hash_xor_i[31:28]),
	.three_bits_o(stage1_output[23:21])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_8 (
	.four_bits_i(hash_xor_i[35:32]),
	.three_bits_o(stage1_output[26:24])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_9 (
	.four_bits_i(hash_xor_i[39:36]),
	.three_bits_o(stage1_output[29:27])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_10 (
	.four_bits_i(hash_xor_i[43:40]),
	.three_bits_o(stage1_output[32:30])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_11 (
	.four_bits_i(hash_xor_i[47:44]),
	.three_bits_o(stage1_output[35:33])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_12 (
	.four_bits_i(hash_xor_i[51:48]),
	.three_bits_o(stage1_output[38:36])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_13 (
	.four_bits_i(hash_xor_i[55:52]),
	.three_bits_o(stage1_output[41:39])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_14 (
	.four_bits_i(hash_xor_i[59:56]),
	.three_bits_o(stage1_output[44:42])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_15 (
	.four_bits_i(hash_xor_i[63:60]),
	.three_bits_o(stage1_output[47:45])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_16 (
	.four_bits_i(hash_xor_i[67:64]),
	.three_bits_o(stage1_output[50:48])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_17 (
	.four_bits_i(hash_xor_i[71:68]),
	.three_bits_o(stage1_output[53:51])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_18 (
	.four_bits_i(hash_xor_i[75:72]),
	.three_bits_o(stage1_output[56:54])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_19 (
	.four_bits_i(hash_xor_i[79:76]),
	.three_bits_o(stage1_output[59:57])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_20 (
	.four_bits_i(hash_xor_i[83:80]),
	.three_bits_o(stage1_output[62:60])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_21 (
	.four_bits_i(hash_xor_i[87:84]),
	.three_bits_o(stage1_output[65:63])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_22 (
	.four_bits_i(hash_xor_i[91:88]),
	.three_bits_o(stage1_output[68:66])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_23 (
	.four_bits_i(hash_xor_i[95:92]),
	.three_bits_o(stage1_output[71:69])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_24 (
	.four_bits_i(hash_xor_i[99:96]),
	.three_bits_o(stage1_output[74:72])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_25 (
	.four_bits_i(hash_xor_i[103:100]),
	.three_bits_o(stage1_output[77:75])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_26 (
	.four_bits_i(hash_xor_i[107:104]),
	.three_bits_o(stage1_output[80:78])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_27 (
	.four_bits_i(hash_xor_i[111:108]),
	.three_bits_o(stage1_output[83:81])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_28 (
	.four_bits_i(hash_xor_i[115:112]),
	.three_bits_o(stage1_output[86:84])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_29 (
	.four_bits_i(hash_xor_i[119:116]),
	.three_bits_o(stage1_output[89:87])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_30 (
	.four_bits_i(hash_xor_i[123:120]),
	.three_bits_o(stage1_output[92:90])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_31 (
	.four_bits_i(hash_xor_i[127:124]),
	.three_bits_o(stage1_output[95:93])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_32 (
	.four_bits_i(hash_xor_i[131:128]),
	.three_bits_o(stage1_output[98:96])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_33 (
	.four_bits_i(hash_xor_i[135:132]),
	.three_bits_o(stage1_output[101:99])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_34 (
	.four_bits_i(hash_xor_i[139:136]),
	.three_bits_o(stage1_output[104:102])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_35 (
	.four_bits_i(hash_xor_i[143:140]),
	.three_bits_o(stage1_output[107:105])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_36 (
	.four_bits_i(hash_xor_i[147:144]),
	.three_bits_o(stage1_output[110:108])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_37 (
	.four_bits_i(hash_xor_i[151:148]),
	.three_bits_o(stage1_output[113:111])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_38 (
	.four_bits_i(hash_xor_i[155:152]),
	.three_bits_o(stage1_output[116:114])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_39 (
	.four_bits_i(hash_xor_i[159:156]),
	.three_bits_o(stage1_output[119:117])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_40 (
	.four_bits_i(hash_xor_i[163:160]),
	.three_bits_o(stage1_output[122:120])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_41 (
	.four_bits_i(hash_xor_i[167:164]),
	.three_bits_o(stage1_output[125:123])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_42 (
	.four_bits_i(hash_xor_i[171:168]),
	.three_bits_o(stage1_output[128:126])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_43 (
	.four_bits_i(hash_xor_i[175:172]),
	.three_bits_o(stage1_output[131:129])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_44 (
	.four_bits_i(hash_xor_i[179:176]),
	.three_bits_o(stage1_output[134:132])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_45 (
	.four_bits_i(hash_xor_i[183:180]),
	.three_bits_o(stage1_output[137:135])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_46 (
	.four_bits_i(hash_xor_i[187:184]),
	.three_bits_o(stage1_output[140:138])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_47 (
	.four_bits_i(hash_xor_i[191:188]),
	.three_bits_o(stage1_output[143:141])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_48 (
	.four_bits_i(hash_xor_i[195:192]),
	.three_bits_o(stage1_output[146:144])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_49 (
	.four_bits_i(hash_xor_i[199:196]),
	.three_bits_o(stage1_output[149:147])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_50 (
	.four_bits_i(hash_xor_i[203:200]),
	.three_bits_o(stage1_output[152:150])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_51 (
	.four_bits_i(hash_xor_i[207:204]),
	.three_bits_o(stage1_output[155:153])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_52 (
	.four_bits_i(hash_xor_i[211:208]),
	.three_bits_o(stage1_output[158:156])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_53 (
	.four_bits_i(hash_xor_i[215:212]),
	.three_bits_o(stage1_output[161:159])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_54 (
	.four_bits_i(hash_xor_i[219:216]),
	.three_bits_o(stage1_output[164:162])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_55 (
	.four_bits_i(hash_xor_i[223:220]),
	.three_bits_o(stage1_output[167:165])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_56 (
	.four_bits_i(hash_xor_i[227:224]),
	.three_bits_o(stage1_output[170:168])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_57 (
	.four_bits_i(hash_xor_i[231:228]),
	.three_bits_o(stage1_output[173:171])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_58 (
	.four_bits_i(hash_xor_i[235:232]),
	.three_bits_o(stage1_output[176:174])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_59 (
	.four_bits_i(hash_xor_i[239:236]),
	.three_bits_o(stage1_output[179:177])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_60 (
	.four_bits_i(hash_xor_i[243:240]),
	.three_bits_o(stage1_output[182:180])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_61 (
	.four_bits_i(hash_xor_i[247:244]),
	.three_bits_o(stage1_output[185:183])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_62 (
	.four_bits_i(hash_xor_i[251:248]),
	.three_bits_o(stage1_output[188:186])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_63 (
	.four_bits_i(hash_xor_i[255:252]),
	.three_bits_o(stage1_output[191:189])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_64 (
	.four_bits_i(hash_xor_i[259:256]),
	.three_bits_o(stage1_output[194:192])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_65 (
	.four_bits_i(hash_xor_i[263:260]),
	.three_bits_o(stage1_output[197:195])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_66 (
	.four_bits_i(hash_xor_i[267:264]),
	.three_bits_o(stage1_output[200:198])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_67 (
	.four_bits_i(hash_xor_i[271:268]),
	.three_bits_o(stage1_output[203:201])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_68 (
	.four_bits_i(hash_xor_i[275:272]),
	.three_bits_o(stage1_output[206:204])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_69 (
	.four_bits_i(hash_xor_i[279:276]),
	.three_bits_o(stage1_output[209:207])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_70 (
	.four_bits_i(hash_xor_i[283:280]),
	.three_bits_o(stage1_output[212:210])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_71 (
	.four_bits_i(hash_xor_i[287:284]),
	.three_bits_o(stage1_output[215:213])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_72 (
	.four_bits_i(hash_xor_i[291:288]),
	.three_bits_o(stage1_output[218:216])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_73 (
	.four_bits_i(hash_xor_i[295:292]),
	.three_bits_o(stage1_output[221:219])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_74 (
	.four_bits_i(hash_xor_i[299:296]),
	.three_bits_o(stage1_output[224:222])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_75 (
	.four_bits_i(hash_xor_i[303:300]),
	.three_bits_o(stage1_output[227:225])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_76 (
	.four_bits_i(hash_xor_i[307:304]),
	.three_bits_o(stage1_output[230:228])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_77 (
	.four_bits_i(hash_xor_i[311:308]),
	.three_bits_o(stage1_output[233:231])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_78 (
	.four_bits_i(hash_xor_i[315:312]),
	.three_bits_o(stage1_output[236:234])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_79 (
	.four_bits_i(hash_xor_i[319:316]),
	.three_bits_o(stage1_output[239:237])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_80 (
	.four_bits_i(hash_xor_i[323:320]),
	.three_bits_o(stage1_output[242:240])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_81 (
	.four_bits_i(hash_xor_i[327:324]),
	.three_bits_o(stage1_output[245:243])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_82 (
	.four_bits_i(hash_xor_i[331:328]),
	.three_bits_o(stage1_output[248:246])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_83 (
	.four_bits_i(hash_xor_i[335:332]),
	.three_bits_o(stage1_output[251:249])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_84 (
	.four_bits_i(hash_xor_i[339:336]),
	.three_bits_o(stage1_output[254:252])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_85 (
	.four_bits_i(hash_xor_i[343:340]),
	.three_bits_o(stage1_output[257:255])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_86 (
	.four_bits_i(hash_xor_i[347:344]),
	.three_bits_o(stage1_output[260:258])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_87 (
	.four_bits_i(hash_xor_i[351:348]),
	.three_bits_o(stage1_output[263:261])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_88 (
	.four_bits_i(hash_xor_i[355:352]),
	.three_bits_o(stage1_output[266:264])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_89 (
	.four_bits_i(hash_xor_i[359:356]),
	.three_bits_o(stage1_output[269:267])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_90 (
	.four_bits_i(hash_xor_i[363:360]),
	.three_bits_o(stage1_output[272:270])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_91 (
	.four_bits_i(hash_xor_i[367:364]),
	.three_bits_o(stage1_output[275:273])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_92 (
	.four_bits_i(hash_xor_i[371:368]),
	.three_bits_o(stage1_output[278:276])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_93 (
	.four_bits_i(hash_xor_i[375:372]),
	.three_bits_o(stage1_output[281:279])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_94 (
	.four_bits_i(hash_xor_i[379:376]),
	.three_bits_o(stage1_output[284:282])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_95 (
	.four_bits_i(hash_xor_i[383:380]),
	.three_bits_o(stage1_output[287:285])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_96 (
	.four_bits_i(hash_xor_i[387:384]),
	.three_bits_o(stage1_output[290:288])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_97 (
	.four_bits_i(hash_xor_i[391:388]),
	.three_bits_o(stage1_output[293:291])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_98 (
	.four_bits_i(hash_xor_i[395:392]),
	.three_bits_o(stage1_output[296:294])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_99 (
	.four_bits_i(hash_xor_i[399:396]),
	.three_bits_o(stage1_output[299:297])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_100 (
	.four_bits_i(hash_xor_i[403:400]),
	.three_bits_o(stage1_output[302:300])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_101 (
	.four_bits_i(hash_xor_i[407:404]),
	.three_bits_o(stage1_output[305:303])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_102 (
	.four_bits_i(hash_xor_i[411:408]),
	.three_bits_o(stage1_output[308:306])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_103 (
	.four_bits_i(hash_xor_i[415:412]),
	.three_bits_o(stage1_output[311:309])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_104 (
	.four_bits_i(hash_xor_i[419:416]),
	.three_bits_o(stage1_output[314:312])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_105 (
	.four_bits_i(hash_xor_i[423:420]),
	.three_bits_o(stage1_output[317:315])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_106 (
	.four_bits_i(hash_xor_i[427:424]),
	.three_bits_o(stage1_output[320:318])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_107 (
	.four_bits_i(hash_xor_i[431:428]),
	.three_bits_o(stage1_output[323:321])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_108 (
	.four_bits_i(hash_xor_i[435:432]),
	.three_bits_o(stage1_output[326:324])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_109 (
	.four_bits_i(hash_xor_i[439:436]),
	.three_bits_o(stage1_output[329:327])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_110 (
	.four_bits_i(hash_xor_i[443:440]),
	.three_bits_o(stage1_output[332:330])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_111 (
	.four_bits_i(hash_xor_i[447:444]),
	.three_bits_o(stage1_output[335:333])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_112 (
	.four_bits_i(hash_xor_i[451:448]),
	.three_bits_o(stage1_output[338:336])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_113 (
	.four_bits_i(hash_xor_i[455:452]),
	.three_bits_o(stage1_output[341:339])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_114 (
	.four_bits_i(hash_xor_i[459:456]),
	.three_bits_o(stage1_output[344:342])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_115 (
	.four_bits_i(hash_xor_i[463:460]),
	.three_bits_o(stage1_output[347:345])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_116 (
	.four_bits_i(hash_xor_i[467:464]),
	.three_bits_o(stage1_output[350:348])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_117 (
	.four_bits_i(hash_xor_i[471:468]),
	.three_bits_o(stage1_output[353:351])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_118 (
	.four_bits_i(hash_xor_i[475:472]),
	.three_bits_o(stage1_output[356:354])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_119 (
	.four_bits_i(hash_xor_i[479:476]),
	.three_bits_o(stage1_output[359:357])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_120 (
	.four_bits_i(hash_xor_i[483:480]),
	.three_bits_o(stage1_output[362:360])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_121 (
	.four_bits_i(hash_xor_i[487:484]),
	.three_bits_o(stage1_output[365:363])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_122 (
	.four_bits_i(hash_xor_i[491:488]),
	.three_bits_o(stage1_output[368:366])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_123 (
	.four_bits_i(hash_xor_i[495:492]),
	.three_bits_o(stage1_output[371:369])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_124 (
	.four_bits_i(hash_xor_i[499:496]),
	.three_bits_o(stage1_output[374:372])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_125 (
	.four_bits_i(hash_xor_i[503:500]),
	.three_bits_o(stage1_output[377:375])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_126 (
	.four_bits_i(hash_xor_i[507:504]),
	.three_bits_o(stage1_output[380:378])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_127 (
	.four_bits_i(hash_xor_i[511:508]),
	.three_bits_o(stage1_output[383:381])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_128 (
	.four_bits_i(hash_xor_i[515:512]),
	.three_bits_o(stage1_output[386:384])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_129 (
	.four_bits_i(hash_xor_i[519:516]),
	.three_bits_o(stage1_output[389:387])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_130 (
	.four_bits_i(hash_xor_i[523:520]),
	.three_bits_o(stage1_output[392:390])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_131 (
	.four_bits_i(hash_xor_i[527:524]),
	.three_bits_o(stage1_output[395:393])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_132 (
	.four_bits_i(hash_xor_i[531:528]),
	.three_bits_o(stage1_output[398:396])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_133 (
	.four_bits_i(hash_xor_i[535:532]),
	.three_bits_o(stage1_output[401:399])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_134 (
	.four_bits_i(hash_xor_i[539:536]),
	.three_bits_o(stage1_output[404:402])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_135 (
	.four_bits_i(hash_xor_i[543:540]),
	.three_bits_o(stage1_output[407:405])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_136 (
	.four_bits_i(hash_xor_i[547:544]),
	.three_bits_o(stage1_output[410:408])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_137 (
	.four_bits_i(hash_xor_i[551:548]),
	.three_bits_o(stage1_output[413:411])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_138 (
	.four_bits_i(hash_xor_i[555:552]),
	.three_bits_o(stage1_output[416:414])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_139 (
	.four_bits_i(hash_xor_i[559:556]),
	.three_bits_o(stage1_output[419:417])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_140 (
	.four_bits_i(hash_xor_i[563:560]),
	.three_bits_o(stage1_output[422:420])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_141 (
	.four_bits_i(hash_xor_i[567:564]),
	.three_bits_o(stage1_output[425:423])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_142 (
	.four_bits_i(hash_xor_i[571:568]),
	.three_bits_o(stage1_output[428:426])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_143 (
	.four_bits_i(hash_xor_i[575:572]),
	.three_bits_o(stage1_output[431:429])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_144 (
	.four_bits_i(hash_xor_i[579:576]),
	.three_bits_o(stage1_output[434:432])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_145 (
	.four_bits_i(hash_xor_i[583:580]),
	.three_bits_o(stage1_output[437:435])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_146 (
	.four_bits_i(hash_xor_i[587:584]),
	.three_bits_o(stage1_output[440:438])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_147 (
	.four_bits_i(hash_xor_i[591:588]),
	.three_bits_o(stage1_output[443:441])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_148 (
	.four_bits_i(hash_xor_i[595:592]),
	.three_bits_o(stage1_output[446:444])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_149 (
	.four_bits_i(hash_xor_i[599:596]),
	.three_bits_o(stage1_output[449:447])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_150 (
	.four_bits_i(hash_xor_i[603:600]),
	.three_bits_o(stage1_output[452:450])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_151 (
	.four_bits_i(hash_xor_i[607:604]),
	.three_bits_o(stage1_output[455:453])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_152 (
	.four_bits_i(hash_xor_i[611:608]),
	.three_bits_o(stage1_output[458:456])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_153 (
	.four_bits_i(hash_xor_i[615:612]),
	.three_bits_o(stage1_output[461:459])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_154 (
	.four_bits_i(hash_xor_i[619:616]),
	.three_bits_o(stage1_output[464:462])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_155 (
	.four_bits_i(hash_xor_i[623:620]),
	.three_bits_o(stage1_output[467:465])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_156 (
	.four_bits_i(hash_xor_i[627:624]),
	.three_bits_o(stage1_output[470:468])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_157 (
	.four_bits_i(hash_xor_i[631:628]),
	.three_bits_o(stage1_output[473:471])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_158 (
	.four_bits_i(hash_xor_i[635:632]),
	.three_bits_o(stage1_output[476:474])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_159 (
	.four_bits_i(hash_xor_i[639:636]),
	.three_bits_o(stage1_output[479:477])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_160 (
	.four_bits_i(hash_xor_i[643:640]),
	.three_bits_o(stage1_output[482:480])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_161 (
	.four_bits_i(hash_xor_i[647:644]),
	.three_bits_o(stage1_output[485:483])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_162 (
	.four_bits_i(hash_xor_i[651:648]),
	.three_bits_o(stage1_output[488:486])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_163 (
	.four_bits_i(hash_xor_i[655:652]),
	.three_bits_o(stage1_output[491:489])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_164 (
	.four_bits_i(hash_xor_i[659:656]),
	.three_bits_o(stage1_output[494:492])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_165 (
	.four_bits_i(hash_xor_i[663:660]),
	.three_bits_o(stage1_output[497:495])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_166 (
	.four_bits_i(hash_xor_i[667:664]),
	.three_bits_o(stage1_output[500:498])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_167 (
	.four_bits_i(hash_xor_i[671:668]),
	.three_bits_o(stage1_output[503:501])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_168 (
	.four_bits_i(hash_xor_i[675:672]),
	.three_bits_o(stage1_output[506:504])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_169 (
	.four_bits_i(hash_xor_i[679:676]),
	.three_bits_o(stage1_output[509:507])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_170 (
	.four_bits_i(hash_xor_i[683:680]),
	.three_bits_o(stage1_output[512:510])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_171 (
	.four_bits_i(hash_xor_i[687:684]),
	.three_bits_o(stage1_output[515:513])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_172 (
	.four_bits_i(hash_xor_i[691:688]),
	.three_bits_o(stage1_output[518:516])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_173 (
	.four_bits_i(hash_xor_i[695:692]),
	.three_bits_o(stage1_output[521:519])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_174 (
	.four_bits_i(hash_xor_i[699:696]),
	.three_bits_o(stage1_output[524:522])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_175 (
	.four_bits_i(hash_xor_i[703:700]),
	.three_bits_o(stage1_output[527:525])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_176 (
	.four_bits_i(hash_xor_i[707:704]),
	.three_bits_o(stage1_output[530:528])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_177 (
	.four_bits_i(hash_xor_i[711:708]),
	.three_bits_o(stage1_output[533:531])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_178 (
	.four_bits_i(hash_xor_i[715:712]),
	.three_bits_o(stage1_output[536:534])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_179 (
	.four_bits_i(hash_xor_i[719:716]),
	.three_bits_o(stage1_output[539:537])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_180 (
	.four_bits_i(hash_xor_i[723:720]),
	.three_bits_o(stage1_output[542:540])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_181 (
	.four_bits_i(hash_xor_i[727:724]),
	.three_bits_o(stage1_output[545:543])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_182 (
	.four_bits_i(hash_xor_i[731:728]),
	.three_bits_o(stage1_output[548:546])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_183 (
	.four_bits_i(hash_xor_i[735:732]),
	.three_bits_o(stage1_output[551:549])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_184 (
	.four_bits_i(hash_xor_i[739:736]),
	.three_bits_o(stage1_output[554:552])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_185 (
	.four_bits_i(hash_xor_i[743:740]),
	.three_bits_o(stage1_output[557:555])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_186 (
	.four_bits_i(hash_xor_i[747:744]),
	.three_bits_o(stage1_output[560:558])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_187 (
	.four_bits_i(hash_xor_i[751:748]),
	.three_bits_o(stage1_output[563:561])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_188 (
	.four_bits_i(hash_xor_i[755:752]),
	.three_bits_o(stage1_output[566:564])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_189 (
	.four_bits_i(hash_xor_i[759:756]),
	.three_bits_o(stage1_output[569:567])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_190 (
	.four_bits_i(hash_xor_i[763:760]),
	.three_bits_o(stage1_output[572:570])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_191 (
	.four_bits_i(hash_xor_i[767:764]),
	.three_bits_o(stage1_output[575:573])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_192 (
	.four_bits_i(hash_xor_i[771:768]),
	.three_bits_o(stage1_output[578:576])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_193 (
	.four_bits_i(hash_xor_i[775:772]),
	.three_bits_o(stage1_output[581:579])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_194 (
	.four_bits_i(hash_xor_i[779:776]),
	.three_bits_o(stage1_output[584:582])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_195 (
	.four_bits_i(hash_xor_i[783:780]),
	.three_bits_o(stage1_output[587:585])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_196 (
	.four_bits_i(hash_xor_i[787:784]),
	.three_bits_o(stage1_output[590:588])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_197 (
	.four_bits_i(hash_xor_i[791:788]),
	.three_bits_o(stage1_output[593:591])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_198 (
	.four_bits_i(hash_xor_i[795:792]),
	.three_bits_o(stage1_output[596:594])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_199 (
	.four_bits_i(hash_xor_i[799:796]),
	.three_bits_o(stage1_output[599:597])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_200 (
	.four_bits_i(hash_xor_i[803:800]),
	.three_bits_o(stage1_output[602:600])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_201 (
	.four_bits_i(hash_xor_i[807:804]),
	.three_bits_o(stage1_output[605:603])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_202 (
	.four_bits_i(hash_xor_i[811:808]),
	.three_bits_o(stage1_output[608:606])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_203 (
	.four_bits_i(hash_xor_i[815:812]),
	.three_bits_o(stage1_output[611:609])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_204 (
	.four_bits_i(hash_xor_i[819:816]),
	.three_bits_o(stage1_output[614:612])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_205 (
	.four_bits_i(hash_xor_i[823:820]),
	.three_bits_o(stage1_output[617:615])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_206 (
	.four_bits_i(hash_xor_i[827:824]),
	.three_bits_o(stage1_output[620:618])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_207 (
	.four_bits_i(hash_xor_i[831:828]),
	.three_bits_o(stage1_output[623:621])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_208 (
	.four_bits_i(hash_xor_i[835:832]),
	.three_bits_o(stage1_output[626:624])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_209 (
	.four_bits_i(hash_xor_i[839:836]),
	.three_bits_o(stage1_output[629:627])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_210 (
	.four_bits_i(hash_xor_i[843:840]),
	.three_bits_o(stage1_output[632:630])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_211 (
	.four_bits_i(hash_xor_i[847:844]),
	.three_bits_o(stage1_output[635:633])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_212 (
	.four_bits_i(hash_xor_i[851:848]),
	.three_bits_o(stage1_output[638:636])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_213 (
	.four_bits_i(hash_xor_i[855:852]),
	.three_bits_o(stage1_output[641:639])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_214 (
	.four_bits_i(hash_xor_i[859:856]),
	.three_bits_o(stage1_output[644:642])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_215 (
	.four_bits_i(hash_xor_i[863:860]),
	.three_bits_o(stage1_output[647:645])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_216 (
	.four_bits_i(hash_xor_i[867:864]),
	.three_bits_o(stage1_output[650:648])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_217 (
	.four_bits_i(hash_xor_i[871:868]),
	.three_bits_o(stage1_output[653:651])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_218 (
	.four_bits_i(hash_xor_i[875:872]),
	.three_bits_o(stage1_output[656:654])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_219 (
	.four_bits_i(hash_xor_i[879:876]),
	.three_bits_o(stage1_output[659:657])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_220 (
	.four_bits_i(hash_xor_i[883:880]),
	.three_bits_o(stage1_output[662:660])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_221 (
	.four_bits_i(hash_xor_i[887:884]),
	.three_bits_o(stage1_output[665:663])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_222 (
	.four_bits_i(hash_xor_i[891:888]),
	.three_bits_o(stage1_output[668:666])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_223 (
	.four_bits_i(hash_xor_i[895:892]),
	.three_bits_o(stage1_output[671:669])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_224 (
	.four_bits_i(hash_xor_i[899:896]),
	.three_bits_o(stage1_output[674:672])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_225 (
	.four_bits_i(hash_xor_i[903:900]),
	.three_bits_o(stage1_output[677:675])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_226 (
	.four_bits_i(hash_xor_i[907:904]),
	.three_bits_o(stage1_output[680:678])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_227 (
	.four_bits_i(hash_xor_i[911:908]),
	.three_bits_o(stage1_output[683:681])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_228 (
	.four_bits_i(hash_xor_i[915:912]),
	.three_bits_o(stage1_output[686:684])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_229 (
	.four_bits_i(hash_xor_i[919:916]),
	.three_bits_o(stage1_output[689:687])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_230 (
	.four_bits_i(hash_xor_i[923:920]),
	.three_bits_o(stage1_output[692:690])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_231 (
	.four_bits_i(hash_xor_i[927:924]),
	.three_bits_o(stage1_output[695:693])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_232 (
	.four_bits_i(hash_xor_i[931:928]),
	.three_bits_o(stage1_output[698:696])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_233 (
	.four_bits_i(hash_xor_i[935:932]),
	.three_bits_o(stage1_output[701:699])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_234 (
	.four_bits_i(hash_xor_i[939:936]),
	.three_bits_o(stage1_output[704:702])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_235 (
	.four_bits_i(hash_xor_i[943:940]),
	.three_bits_o(stage1_output[707:705])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_236 (
	.four_bits_i(hash_xor_i[947:944]),
	.three_bits_o(stage1_output[710:708])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_237 (
	.four_bits_i(hash_xor_i[951:948]),
	.three_bits_o(stage1_output[713:711])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_238 (
	.four_bits_i(hash_xor_i[955:952]),
	.three_bits_o(stage1_output[716:714])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_239 (
	.four_bits_i(hash_xor_i[959:956]),
	.three_bits_o(stage1_output[719:717])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_240 (
	.four_bits_i(hash_xor_i[963:960]),
	.three_bits_o(stage1_output[722:720])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_241 (
	.four_bits_i(hash_xor_i[967:964]),
	.three_bits_o(stage1_output[725:723])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_242 (
	.four_bits_i(hash_xor_i[971:968]),
	.three_bits_o(stage1_output[728:726])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_243 (
	.four_bits_i(hash_xor_i[975:972]),
	.three_bits_o(stage1_output[731:729])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_244 (
	.four_bits_i(hash_xor_i[979:976]),
	.three_bits_o(stage1_output[734:732])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_245 (
	.four_bits_i(hash_xor_i[983:980]),
	.three_bits_o(stage1_output[737:735])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_246 (
	.four_bits_i(hash_xor_i[987:984]),
	.three_bits_o(stage1_output[740:738])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_247 (
	.four_bits_i(hash_xor_i[991:988]),
	.three_bits_o(stage1_output[743:741])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_248 (
	.four_bits_i(hash_xor_i[995:992]),
	.three_bits_o(stage1_output[746:744])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_249 (
	.four_bits_i(hash_xor_i[999:996]),
	.three_bits_o(stage1_output[749:747])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_250 (
	.four_bits_i(hash_xor_i[1003:1000]),
	.three_bits_o(stage1_output[752:750])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_251 (
	.four_bits_i(hash_xor_i[1007:1004]),
	.three_bits_o(stage1_output[755:753])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_252 (
	.four_bits_i(hash_xor_i[1011:1008]),
	.three_bits_o(stage1_output[758:756])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_253 (
	.four_bits_i(hash_xor_i[1015:1012]),
	.three_bits_o(stage1_output[761:759])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_254 (
	.four_bits_i(hash_xor_i[1019:1016]),
	.three_bits_o(stage1_output[764:762])
);

hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_255 (
	.four_bits_i(hash_xor_i[1023:1020]),
	.three_bits_o(stage1_output[767:765])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_0 (
	.six_bits_i(stage1_output[5:0]),
	.four_bits_o(stage2_output[3:0])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_1 (
	.six_bits_i(stage1_output[11:6]),
	.four_bits_o(stage2_output[7:4])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_2 (
	.six_bits_i(stage1_output[17:12]),
	.four_bits_o(stage2_output[11:8])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_3 (
	.six_bits_i(stage1_output[23:18]),
	.four_bits_o(stage2_output[15:12])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_4 (
	.six_bits_i(stage1_output[29:24]),
	.four_bits_o(stage2_output[19:16])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_5 (
	.six_bits_i(stage1_output[35:30]),
	.four_bits_o(stage2_output[23:20])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_6 (
	.six_bits_i(stage1_output[41:36]),
	.four_bits_o(stage2_output[27:24])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_7 (
	.six_bits_i(stage1_output[47:42]),
	.four_bits_o(stage2_output[31:28])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_8 (
	.six_bits_i(stage1_output[53:48]),
	.four_bits_o(stage2_output[35:32])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_9 (
	.six_bits_i(stage1_output[59:54]),
	.four_bits_o(stage2_output[39:36])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_10 (
	.six_bits_i(stage1_output[65:60]),
	.four_bits_o(stage2_output[43:40])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_11 (
	.six_bits_i(stage1_output[71:66]),
	.four_bits_o(stage2_output[47:44])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_12 (
	.six_bits_i(stage1_output[77:72]),
	.four_bits_o(stage2_output[51:48])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_13 (
	.six_bits_i(stage1_output[83:78]),
	.four_bits_o(stage2_output[55:52])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_14 (
	.six_bits_i(stage1_output[89:84]),
	.four_bits_o(stage2_output[59:56])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_15 (
	.six_bits_i(stage1_output[95:90]),
	.four_bits_o(stage2_output[63:60])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_16 (
	.six_bits_i(stage1_output[101:96]),
	.four_bits_o(stage2_output[67:64])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_17 (
	.six_bits_i(stage1_output[107:102]),
	.four_bits_o(stage2_output[71:68])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_18 (
	.six_bits_i(stage1_output[113:108]),
	.four_bits_o(stage2_output[75:72])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_19 (
	.six_bits_i(stage1_output[119:114]),
	.four_bits_o(stage2_output[79:76])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_20 (
	.six_bits_i(stage1_output[125:120]),
	.four_bits_o(stage2_output[83:80])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_21 (
	.six_bits_i(stage1_output[131:126]),
	.four_bits_o(stage2_output[87:84])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_22 (
	.six_bits_i(stage1_output[137:132]),
	.four_bits_o(stage2_output[91:88])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_23 (
	.six_bits_i(stage1_output[143:138]),
	.four_bits_o(stage2_output[95:92])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_24 (
	.six_bits_i(stage1_output[149:144]),
	.four_bits_o(stage2_output[99:96])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_25 (
	.six_bits_i(stage1_output[155:150]),
	.four_bits_o(stage2_output[103:100])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_26 (
	.six_bits_i(stage1_output[161:156]),
	.four_bits_o(stage2_output[107:104])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_27 (
	.six_bits_i(stage1_output[167:162]),
	.four_bits_o(stage2_output[111:108])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_28 (
	.six_bits_i(stage1_output[173:168]),
	.four_bits_o(stage2_output[115:112])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_29 (
	.six_bits_i(stage1_output[179:174]),
	.four_bits_o(stage2_output[119:116])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_30 (
	.six_bits_i(stage1_output[185:180]),
	.four_bits_o(stage2_output[123:120])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_31 (
	.six_bits_i(stage1_output[191:186]),
	.four_bits_o(stage2_output[127:124])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_32 (
	.six_bits_i(stage1_output[197:192]),
	.four_bits_o(stage2_output[131:128])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_33 (
	.six_bits_i(stage1_output[203:198]),
	.four_bits_o(stage2_output[135:132])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_34 (
	.six_bits_i(stage1_output[209:204]),
	.four_bits_o(stage2_output[139:136])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_35 (
	.six_bits_i(stage1_output[215:210]),
	.four_bits_o(stage2_output[143:140])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_36 (
	.six_bits_i(stage1_output[221:216]),
	.four_bits_o(stage2_output[147:144])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_37 (
	.six_bits_i(stage1_output[227:222]),
	.four_bits_o(stage2_output[151:148])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_38 (
	.six_bits_i(stage1_output[233:228]),
	.four_bits_o(stage2_output[155:152])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_39 (
	.six_bits_i(stage1_output[239:234]),
	.four_bits_o(stage2_output[159:156])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_40 (
	.six_bits_i(stage1_output[245:240]),
	.four_bits_o(stage2_output[163:160])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_41 (
	.six_bits_i(stage1_output[251:246]),
	.four_bits_o(stage2_output[167:164])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_42 (
	.six_bits_i(stage1_output[257:252]),
	.four_bits_o(stage2_output[171:168])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_43 (
	.six_bits_i(stage1_output[263:258]),
	.four_bits_o(stage2_output[175:172])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_44 (
	.six_bits_i(stage1_output[269:264]),
	.four_bits_o(stage2_output[179:176])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_45 (
	.six_bits_i(stage1_output[275:270]),
	.four_bits_o(stage2_output[183:180])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_46 (
	.six_bits_i(stage1_output[281:276]),
	.four_bits_o(stage2_output[187:184])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_47 (
	.six_bits_i(stage1_output[287:282]),
	.four_bits_o(stage2_output[191:188])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_48 (
	.six_bits_i(stage1_output[293:288]),
	.four_bits_o(stage2_output[195:192])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_49 (
	.six_bits_i(stage1_output[299:294]),
	.four_bits_o(stage2_output[199:196])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_50 (
	.six_bits_i(stage1_output[305:300]),
	.four_bits_o(stage2_output[203:200])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_51 (
	.six_bits_i(stage1_output[311:306]),
	.four_bits_o(stage2_output[207:204])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_52 (
	.six_bits_i(stage1_output[317:312]),
	.four_bits_o(stage2_output[211:208])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_53 (
	.six_bits_i(stage1_output[323:318]),
	.four_bits_o(stage2_output[215:212])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_54 (
	.six_bits_i(stage1_output[329:324]),
	.four_bits_o(stage2_output[219:216])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_55 (
	.six_bits_i(stage1_output[335:330]),
	.four_bits_o(stage2_output[223:220])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_56 (
	.six_bits_i(stage1_output[341:336]),
	.four_bits_o(stage2_output[227:224])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_57 (
	.six_bits_i(stage1_output[347:342]),
	.four_bits_o(stage2_output[231:228])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_58 (
	.six_bits_i(stage1_output[353:348]),
	.four_bits_o(stage2_output[235:232])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_59 (
	.six_bits_i(stage1_output[359:354]),
	.four_bits_o(stage2_output[239:236])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_60 (
	.six_bits_i(stage1_output[365:360]),
	.four_bits_o(stage2_output[243:240])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_61 (
	.six_bits_i(stage1_output[371:366]),
	.four_bits_o(stage2_output[247:244])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_62 (
	.six_bits_i(stage1_output[377:372]),
	.four_bits_o(stage2_output[251:248])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_63 (
	.six_bits_i(stage1_output[383:378]),
	.four_bits_o(stage2_output[255:252])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_64 (
	.six_bits_i(stage1_output[389:384]),
	.four_bits_o(stage2_output[259:256])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_65 (
	.six_bits_i(stage1_output[395:390]),
	.four_bits_o(stage2_output[263:260])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_66 (
	.six_bits_i(stage1_output[401:396]),
	.four_bits_o(stage2_output[267:264])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_67 (
	.six_bits_i(stage1_output[407:402]),
	.four_bits_o(stage2_output[271:268])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_68 (
	.six_bits_i(stage1_output[413:408]),
	.four_bits_o(stage2_output[275:272])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_69 (
	.six_bits_i(stage1_output[419:414]),
	.four_bits_o(stage2_output[279:276])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_70 (
	.six_bits_i(stage1_output[425:420]),
	.four_bits_o(stage2_output[283:280])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_71 (
	.six_bits_i(stage1_output[431:426]),
	.four_bits_o(stage2_output[287:284])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_72 (
	.six_bits_i(stage1_output[437:432]),
	.four_bits_o(stage2_output[291:288])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_73 (
	.six_bits_i(stage1_output[443:438]),
	.four_bits_o(stage2_output[295:292])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_74 (
	.six_bits_i(stage1_output[449:444]),
	.four_bits_o(stage2_output[299:296])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_75 (
	.six_bits_i(stage1_output[455:450]),
	.four_bits_o(stage2_output[303:300])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_76 (
	.six_bits_i(stage1_output[461:456]),
	.four_bits_o(stage2_output[307:304])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_77 (
	.six_bits_i(stage1_output[467:462]),
	.four_bits_o(stage2_output[311:308])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_78 (
	.six_bits_i(stage1_output[473:468]),
	.four_bits_o(stage2_output[315:312])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_79 (
	.six_bits_i(stage1_output[479:474]),
	.four_bits_o(stage2_output[319:316])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_80 (
	.six_bits_i(stage1_output[485:480]),
	.four_bits_o(stage2_output[323:320])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_81 (
	.six_bits_i(stage1_output[491:486]),
	.four_bits_o(stage2_output[327:324])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_82 (
	.six_bits_i(stage1_output[497:492]),
	.four_bits_o(stage2_output[331:328])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_83 (
	.six_bits_i(stage1_output[503:498]),
	.four_bits_o(stage2_output[335:332])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_84 (
	.six_bits_i(stage1_output[509:504]),
	.four_bits_o(stage2_output[339:336])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_85 (
	.six_bits_i(stage1_output[515:510]),
	.four_bits_o(stage2_output[343:340])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_86 (
	.six_bits_i(stage1_output[521:516]),
	.four_bits_o(stage2_output[347:344])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_87 (
	.six_bits_i(stage1_output[527:522]),
	.four_bits_o(stage2_output[351:348])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_88 (
	.six_bits_i(stage1_output[533:528]),
	.four_bits_o(stage2_output[355:352])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_89 (
	.six_bits_i(stage1_output[539:534]),
	.four_bits_o(stage2_output[359:356])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_90 (
	.six_bits_i(stage1_output[545:540]),
	.four_bits_o(stage2_output[363:360])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_91 (
	.six_bits_i(stage1_output[551:546]),
	.four_bits_o(stage2_output[367:364])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_92 (
	.six_bits_i(stage1_output[557:552]),
	.four_bits_o(stage2_output[371:368])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_93 (
	.six_bits_i(stage1_output[563:558]),
	.four_bits_o(stage2_output[375:372])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_94 (
	.six_bits_i(stage1_output[569:564]),
	.four_bits_o(stage2_output[379:376])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_95 (
	.six_bits_i(stage1_output[575:570]),
	.four_bits_o(stage2_output[383:380])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_96 (
	.six_bits_i(stage1_output[581:576]),
	.four_bits_o(stage2_output[387:384])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_97 (
	.six_bits_i(stage1_output[587:582]),
	.four_bits_o(stage2_output[391:388])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_98 (
	.six_bits_i(stage1_output[593:588]),
	.four_bits_o(stage2_output[395:392])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_99 (
	.six_bits_i(stage1_output[599:594]),
	.four_bits_o(stage2_output[399:396])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_100 (
	.six_bits_i(stage1_output[605:600]),
	.four_bits_o(stage2_output[403:400])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_101 (
	.six_bits_i(stage1_output[611:606]),
	.four_bits_o(stage2_output[407:404])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_102 (
	.six_bits_i(stage1_output[617:612]),
	.four_bits_o(stage2_output[411:408])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_103 (
	.six_bits_i(stage1_output[623:618]),
	.four_bits_o(stage2_output[415:412])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_104 (
	.six_bits_i(stage1_output[629:624]),
	.four_bits_o(stage2_output[419:416])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_105 (
	.six_bits_i(stage1_output[635:630]),
	.four_bits_o(stage2_output[423:420])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_106 (
	.six_bits_i(stage1_output[641:636]),
	.four_bits_o(stage2_output[427:424])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_107 (
	.six_bits_i(stage1_output[647:642]),
	.four_bits_o(stage2_output[431:428])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_108 (
	.six_bits_i(stage1_output[653:648]),
	.four_bits_o(stage2_output[435:432])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_109 (
	.six_bits_i(stage1_output[659:654]),
	.four_bits_o(stage2_output[439:436])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_110 (
	.six_bits_i(stage1_output[665:660]),
	.four_bits_o(stage2_output[443:440])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_111 (
	.six_bits_i(stage1_output[671:666]),
	.four_bits_o(stage2_output[447:444])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_112 (
	.six_bits_i(stage1_output[677:672]),
	.four_bits_o(stage2_output[451:448])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_113 (
	.six_bits_i(stage1_output[683:678]),
	.four_bits_o(stage2_output[455:452])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_114 (
	.six_bits_i(stage1_output[689:684]),
	.four_bits_o(stage2_output[459:456])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_115 (
	.six_bits_i(stage1_output[695:690]),
	.four_bits_o(stage2_output[463:460])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_116 (
	.six_bits_i(stage1_output[701:696]),
	.four_bits_o(stage2_output[467:464])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_117 (
	.six_bits_i(stage1_output[707:702]),
	.four_bits_o(stage2_output[471:468])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_118 (
	.six_bits_i(stage1_output[713:708]),
	.four_bits_o(stage2_output[475:472])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_119 (
	.six_bits_i(stage1_output[719:714]),
	.four_bits_o(stage2_output[479:476])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_120 (
	.six_bits_i(stage1_output[725:720]),
	.four_bits_o(stage2_output[483:480])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_121 (
	.six_bits_i(stage1_output[731:726]),
	.four_bits_o(stage2_output[487:484])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_122 (
	.six_bits_i(stage1_output[737:732]),
	.four_bits_o(stage2_output[491:488])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_123 (
	.six_bits_i(stage1_output[743:738]),
	.four_bits_o(stage2_output[495:492])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_124 (
	.six_bits_i(stage1_output[749:744]),
	.four_bits_o(stage2_output[499:496])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_125 (
	.six_bits_i(stage1_output[755:750]),
	.four_bits_o(stage2_output[503:500])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_126 (
	.six_bits_i(stage1_output[761:756]),
	.four_bits_o(stage2_output[507:504])
);

hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_127 (
	.six_bits_i(stage1_output[767:762]),
	.four_bits_o(stage2_output[511:508])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_0 (
	.eight_bits_i(stage2_output[7:0]),
	.five_bits_o(stage3_output[4:0])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_1 (
	.eight_bits_i(stage2_output[15:8]),
	.five_bits_o(stage3_output[9:5])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_2 (
	.eight_bits_i(stage2_output[23:16]),
	.five_bits_o(stage3_output[14:10])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_3 (
	.eight_bits_i(stage2_output[31:24]),
	.five_bits_o(stage3_output[19:15])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_4 (
	.eight_bits_i(stage2_output[39:32]),
	.five_bits_o(stage3_output[24:20])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_5 (
	.eight_bits_i(stage2_output[47:40]),
	.five_bits_o(stage3_output[29:25])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_6 (
	.eight_bits_i(stage2_output[55:48]),
	.five_bits_o(stage3_output[34:30])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_7 (
	.eight_bits_i(stage2_output[63:56]),
	.five_bits_o(stage3_output[39:35])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_8 (
	.eight_bits_i(stage2_output[71:64]),
	.five_bits_o(stage3_output[44:40])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_9 (
	.eight_bits_i(stage2_output[79:72]),
	.five_bits_o(stage3_output[49:45])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_10 (
	.eight_bits_i(stage2_output[87:80]),
	.five_bits_o(stage3_output[54:50])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_11 (
	.eight_bits_i(stage2_output[95:88]),
	.five_bits_o(stage3_output[59:55])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_12 (
	.eight_bits_i(stage2_output[103:96]),
	.five_bits_o(stage3_output[64:60])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_13 (
	.eight_bits_i(stage2_output[111:104]),
	.five_bits_o(stage3_output[69:65])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_14 (
	.eight_bits_i(stage2_output[119:112]),
	.five_bits_o(stage3_output[74:70])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_15 (
	.eight_bits_i(stage2_output[127:120]),
	.five_bits_o(stage3_output[79:75])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_16 (
	.eight_bits_i(stage2_output[135:128]),
	.five_bits_o(stage3_output[84:80])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_17 (
	.eight_bits_i(stage2_output[143:136]),
	.five_bits_o(stage3_output[89:85])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_18 (
	.eight_bits_i(stage2_output[151:144]),
	.five_bits_o(stage3_output[94:90])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_19 (
	.eight_bits_i(stage2_output[159:152]),
	.five_bits_o(stage3_output[99:95])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_20 (
	.eight_bits_i(stage2_output[167:160]),
	.five_bits_o(stage3_output[104:100])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_21 (
	.eight_bits_i(stage2_output[175:168]),
	.five_bits_o(stage3_output[109:105])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_22 (
	.eight_bits_i(stage2_output[183:176]),
	.five_bits_o(stage3_output[114:110])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_23 (
	.eight_bits_i(stage2_output[191:184]),
	.five_bits_o(stage3_output[119:115])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_24 (
	.eight_bits_i(stage2_output[199:192]),
	.five_bits_o(stage3_output[124:120])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_25 (
	.eight_bits_i(stage2_output[207:200]),
	.five_bits_o(stage3_output[129:125])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_26 (
	.eight_bits_i(stage2_output[215:208]),
	.five_bits_o(stage3_output[134:130])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_27 (
	.eight_bits_i(stage2_output[223:216]),
	.five_bits_o(stage3_output[139:135])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_28 (
	.eight_bits_i(stage2_output[231:224]),
	.five_bits_o(stage3_output[144:140])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_29 (
	.eight_bits_i(stage2_output[239:232]),
	.five_bits_o(stage3_output[149:145])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_30 (
	.eight_bits_i(stage2_output[247:240]),
	.five_bits_o(stage3_output[154:150])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_31 (
	.eight_bits_i(stage2_output[255:248]),
	.five_bits_o(stage3_output[159:155])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_32 (
	.eight_bits_i(stage2_output[263:256]),
	.five_bits_o(stage3_output[164:160])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_33 (
	.eight_bits_i(stage2_output[271:264]),
	.five_bits_o(stage3_output[169:165])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_34 (
	.eight_bits_i(stage2_output[279:272]),
	.five_bits_o(stage3_output[174:170])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_35 (
	.eight_bits_i(stage2_output[287:280]),
	.five_bits_o(stage3_output[179:175])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_36 (
	.eight_bits_i(stage2_output[295:288]),
	.five_bits_o(stage3_output[184:180])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_37 (
	.eight_bits_i(stage2_output[303:296]),
	.five_bits_o(stage3_output[189:185])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_38 (
	.eight_bits_i(stage2_output[311:304]),
	.five_bits_o(stage3_output[194:190])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_39 (
	.eight_bits_i(stage2_output[319:312]),
	.five_bits_o(stage3_output[199:195])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_40 (
	.eight_bits_i(stage2_output[327:320]),
	.five_bits_o(stage3_output[204:200])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_41 (
	.eight_bits_i(stage2_output[335:328]),
	.five_bits_o(stage3_output[209:205])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_42 (
	.eight_bits_i(stage2_output[343:336]),
	.five_bits_o(stage3_output[214:210])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_43 (
	.eight_bits_i(stage2_output[351:344]),
	.five_bits_o(stage3_output[219:215])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_44 (
	.eight_bits_i(stage2_output[359:352]),
	.five_bits_o(stage3_output[224:220])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_45 (
	.eight_bits_i(stage2_output[367:360]),
	.five_bits_o(stage3_output[229:225])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_46 (
	.eight_bits_i(stage2_output[375:368]),
	.five_bits_o(stage3_output[234:230])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_47 (
	.eight_bits_i(stage2_output[383:376]),
	.five_bits_o(stage3_output[239:235])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_48 (
	.eight_bits_i(stage2_output[391:384]),
	.five_bits_o(stage3_output[244:240])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_49 (
	.eight_bits_i(stage2_output[399:392]),
	.five_bits_o(stage3_output[249:245])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_50 (
	.eight_bits_i(stage2_output[407:400]),
	.five_bits_o(stage3_output[254:250])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_51 (
	.eight_bits_i(stage2_output[415:408]),
	.five_bits_o(stage3_output[259:255])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_52 (
	.eight_bits_i(stage2_output[423:416]),
	.five_bits_o(stage3_output[264:260])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_53 (
	.eight_bits_i(stage2_output[431:424]),
	.five_bits_o(stage3_output[269:265])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_54 (
	.eight_bits_i(stage2_output[439:432]),
	.five_bits_o(stage3_output[274:270])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_55 (
	.eight_bits_i(stage2_output[447:440]),
	.five_bits_o(stage3_output[279:275])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_56 (
	.eight_bits_i(stage2_output[455:448]),
	.five_bits_o(stage3_output[284:280])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_57 (
	.eight_bits_i(stage2_output[463:456]),
	.five_bits_o(stage3_output[289:285])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_58 (
	.eight_bits_i(stage2_output[471:464]),
	.five_bits_o(stage3_output[294:290])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_59 (
	.eight_bits_i(stage2_output[479:472]),
	.five_bits_o(stage3_output[299:295])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_60 (
	.eight_bits_i(stage2_output[487:480]),
	.five_bits_o(stage3_output[304:300])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_61 (
	.eight_bits_i(stage2_output[495:488]),
	.five_bits_o(stage3_output[309:305])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_62 (
	.eight_bits_i(stage2_output[503:496]),
	.five_bits_o(stage3_output[314:310])
);

hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_63 (
	.eight_bits_i(stage2_output[511:504]),
	.five_bits_o(stage3_output[319:315])
);

assign hash_bits_off_o = ((((((stage3_output[4:0]+stage3_output[9:5])+(stage3_output[14:10]+stage3_output[19:15]))+((stage3_output[24:20]+stage3_output[29:25])+(stage3_output[34:30]+stage3_output[39:35])))+(((stage3_output[44:40]+stage3_output[49:45])+(stage3_output[54:50]+stage3_output[59:55]))+((stage3_output[64:60]+stage3_output[69:65])+(stage3_output[74:70]+stage3_output[79:75]))))+((((stage3_output[84:80]+stage3_output[89:85])+(stage3_output[94:90]+stage3_output[99:95]))+((stage3_output[104:100]+stage3_output[109:105])+(stage3_output[114:110]+stage3_output[119:115])))+(((stage3_output[124:120]+stage3_output[129:125])+(stage3_output[134:130]+stage3_output[139:135]))+((stage3_output[144:140]+stage3_output[149:145])+(stage3_output[154:150]+stage3_output[159:155])))))+(((((stage3_output[164:160]+stage3_output[169:165])+(stage3_output[174:170]+stage3_output[179:175]))+((stage3_output[184:180]+stage3_output[189:185])+(stage3_output[194:190]+stage3_output[199:195])))+(((stage3_output[204:200]+stage3_output[209:205])+(stage3_output[214:210]+stage3_output[219:215]))+((stage3_output[224:220]+stage3_output[229:225])+(stage3_output[234:230]+stage3_output[239:235]))))+((((stage3_output[244:240]+stage3_output[249:245])+(stage3_output[254:250]+stage3_output[259:255]))+((stage3_output[264:260]+stage3_output[269:265])+(stage3_output[274:270]+stage3_output[279:275])))+(((stage3_output[284:280]+stage3_output[289:285])+(stage3_output[294:290]+stage3_output[299:295]))+((stage3_output[304:300]+stage3_output[309:305])+(stage3_output[314:310]+stage3_output[319:315]))))));

endmodule
