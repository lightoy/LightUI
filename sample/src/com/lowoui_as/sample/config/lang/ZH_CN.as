package com.lowoui_as.sample.config.lang
{
	public class ZH_CN extends Lang
	{
		private static var _ins:ZH_CN = null;

		public static function get ins():ZH_CN
		{
			if (_ins == null)
				_ins = new ZH_CN();

			return _ins;
		}

		public function ZH_CN()
		{
			Comn_Btn_Close = "返回";

			Charpters_Title = "章节选择";
			Charpters_Name1 = "前传 : 神秘事件";
			Charpters_Name2 = "初章 : 暗黑无界";
			Charpters_Name3 = "第二章 : 撤离迪拜城";
			Charpters_Name4 = "第三章 : 突出重围";
			Charpters_Name5 = "第四章 : 新生力量";
			Charpters_Name6 = "第五章 : 外星人之谜";
			Charpters_Detail_Summary = "为了探索太阳系的外层以及更遥远的星际物质，1977年8月20日，NASA发射了一艘名为旅行者2号的太空探测器，半个月后，另一艘同样的太空探测器旅行者1号也于9月5日被发射。这两艘探测器上除了各种科学仪器外，各携带有一张金唱片，收录了地球上各种生命及文化的声音和图像，用来向可能存在的地外文明介绍地球。录制唱片的科学家们原以为，这张唱片被其他文明得到并解读的机会微乎其微，即使发生，也会是在数万年之后。他们错了......<br><br>尽管这两艘探测器预期的电力耗尽时间在2025年左右，但是在2020年之后，人类就再也没有收到过来自旅行者1号的信号，2021年，与旅行者2号也失去了联系，没有人知道发生了什么。<br><br>2073年6月8日，一支庞大的外星舰队突如其来地出现在地球轨道上。没有任何征兆和预警，外星人便开始使用先进的电磁脉冲、激光与等离子武器对人类进行了有史以来最为沉重的空中打击。攻击只持续了不到10个小时，但地球上所有的大型能源与通讯设施都被摧毁殆尽，每一个人口超过百万的人类聚集地都遭受了毁灭式的攻击，地球武装力量尚来不及集结就被完全击溃，政府完全瘫痪，超过60亿人口丧生。<br><br>出于未知的目的，集中营里的人类被外星人作为实验对象研究着，各种奇异的人体现象时有出现，谣言与传说四起。不愿被奴役的人类不断地反抗着，各处的集中营都不断地有人成功逃离。这些逃亡者与那些之前侥幸躲过外星人抓捕的幸存者一起，组织起了许多股小规模的反抗势力，进行着旷日持久的游击战。";

			//,"Charpter 1 : Into Darkness"
			//,"Charpter 2 : Escape"
			//,"Charpter 3 : Introspection"
			//,"Charpter 4 : Alien"
			//,"Charpter 5 : Revenge"
			//,"Charpter Six : Renascence"
		}
	}
}
