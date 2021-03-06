-- Copyright © 2007 Wesley J. Landaker <wjl@icecavern.net>
-- 
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BlowfishPiROM is
  port (
    -- Clock
    CLK_I : in std_logic;

    -- Pi ROM Interface
    ADDR_I : in  std_logic_vector(9 downto 0);
    DATA_O : out std_logic_vector(31 downto 0)
    );
end entity;

architecture rtl of BlowfishPiROM is
  type rom_t is array (0 to 1023) of std_logic_vector(31 downto 0);
  signal rom : rom_t;
begin
  
  process (CLK_I, rom) is
    subtype addr_t is natural range 0 to 1023;
    variable addr : addr_t;
  begin
    if rising_edge(CLK_I) then
      addr := to_integer(unsigned(ADDR_I));
    end if;
    DATA_O <= rom(addr);
  end process;

  rom <= (
    -- S-Box #1
    x"d1310ba6", x"98dfb5ac", x"2ffd72db", x"d01adfb7",
    x"b8e1afed", x"6a267e96", x"ba7c9045", x"f12c7f99",
    x"24a19947", x"b3916cf7", x"0801f2e2", x"858efc16",
    x"636920d8", x"71574e69", x"a458fea3", x"f4933d7e",
    x"0d95748f", x"728eb658", x"718bcd58", x"82154aee",
    x"7b54a41d", x"c25a59b5", x"9c30d539", x"2af26013",
    x"c5d1b023", x"286085f0", x"ca417918", x"b8db38ef",
    x"8e79dcb0", x"603a180e", x"6c9e0e8b", x"b01e8a3e",
    x"d71577c1", x"bd314b27", x"78af2fda", x"55605c60",
    x"e65525f3", x"aa55ab94", x"57489862", x"63e81440",
    x"55ca396a", x"2aab10b6", x"b4cc5c34", x"1141e8ce",
    x"a15486af", x"7c72e993", x"b3ee1411", x"636fbc2a",
    x"2ba9c55d", x"741831f6", x"ce5c3e16", x"9b87931e",
    x"afd6ba33", x"6c24cf5c", x"7a325381", x"28958677",
    x"3b8f4898", x"6b4bb9af", x"c4bfe81b", x"66282193",
    x"61d809cc", x"fb21a991", x"487cac60", x"5dec8032",
    x"ef845d5d", x"e98575b1", x"dc262302", x"eb651b88",
    x"23893e81", x"d396acc5", x"0f6d6ff3", x"83f44239",
    x"2e0b4482", x"a4842004", x"69c8f04a", x"9e1f9b5e",
    x"21c66842", x"f6e96c9a", x"670c9c61", x"abd388f0",
    x"6a51a0d2", x"d8542f68", x"960fa728", x"ab5133a3",
    x"6eef0b6c", x"137a3be4", x"ba3bf050", x"7efb2a98",
    x"a1f1651d", x"39af0176", x"66ca593e", x"82430e88",
    x"8cee8619", x"456f9fb4", x"7d84a5c3", x"3b8b5ebe",
    x"e06f75d8", x"85c12073", x"401a449f", x"56c16aa6",
    x"4ed3aa62", x"363f7706", x"1bfedf72", x"429b023d",
    x"37d0d724", x"d00a1248", x"db0fead3", x"49f1c09b",
    x"075372c9", x"80991b7b", x"25d479d8", x"f6e8def7",
    x"e3fe501a", x"b6794c3b", x"976ce0bd", x"04c006ba",
    x"c1a94fb6", x"409f60c4", x"5e5c9ec2", x"196a2463",
    x"68fb6faf", x"3e6c53b5", x"1339b2eb", x"3b52ec6f",
    x"6dfc511f", x"9b30952c", x"cc814544", x"af5ebd09",
    x"bee3d004", x"de334afd", x"660f2807", x"192e4bb3",
    x"c0cba857", x"45c8740f", x"d20b5f39", x"b9d3fbdb",
    x"5579c0bd", x"1a60320a", x"d6a100c6", x"402c7279",
    x"679f25fe", x"fb1fa3cc", x"8ea5e9f8", x"db3222f8",
    x"3c7516df", x"fd616b15", x"2f501ec8", x"ad0552ab",
    x"323db5fa", x"fd238760", x"53317b48", x"3e00df82",
    x"9e5c57bb", x"ca6f8ca0", x"1a87562e", x"df1769db",
    x"d542a8f6", x"287effc3", x"ac6732c6", x"8c4f5573",
    x"695b27b0", x"bbca58c8", x"e1ffa35d", x"b8f011a0",
    x"10fa3d98", x"fd2183b8", x"4afcb56c", x"2dd1d35b",
    x"9a53e479", x"b6f84565", x"d28e49bc", x"4bfb9790",
    x"e1ddf2da", x"a4cb7e33", x"62fb1341", x"cee4c6e8",
    x"ef20cada", x"36774c01", x"d07e9efe", x"2bf11fb4",
    x"95dbda4d", x"ae909198", x"eaad8e71", x"6b93d5a0",
    x"d08ed1d0", x"afc725e0", x"8e3c5b2f", x"8e7594b7",
    x"8ff6e2fb", x"f2122b64", x"8888b812", x"900df01c",
    x"4fad5ea0", x"688fc31c", x"d1cff191", x"b3a8c1ad",
    x"2f2f2218", x"be0e1777", x"ea752dfe", x"8b021fa1",
    x"e5a0cc0f", x"b56f74e8", x"18acf3d6", x"ce89e299",
    x"b4a84fe0", x"fd13e0b7", x"7cc43b81", x"d2ada8d9",
    x"165fa266", x"80957705", x"93cc7314", x"211a1477",
    x"e6ad2065", x"77b5fa86", x"c75442f5", x"fb9d35cf",
    x"ebcdaf0c", x"7b3e89a0", x"d6411bd3", x"ae1e7e49",
    x"00250e2d", x"2071b35e", x"226800bb", x"57b8e0af",
    x"2464369b", x"f009b91e", x"5563911d", x"59dfa6aa",
    x"78c14389", x"d95a537f", x"207d5ba2", x"02e5b9c5",
    x"83260376", x"6295cfa9", x"11c81968", x"4e734a41",
    x"b3472dca", x"7b14a94a", x"1b510052", x"9a532915",
    x"d60f573f", x"bc9bc6e4", x"2b60a476", x"81e67400",
    x"08ba6fb5", x"571be91f", x"f296ec6b", x"2a0dd915",
    x"b6636521", x"e7b9f9b6", x"ff34052e", x"c5855664",
    x"53b02d5d", x"a99f8fa1", x"08ba4799", x"6e85076a",

    -- S-Box #2
    x"4b7a70e9", x"b5b32944", x"db75092e", x"c4192623",
    x"ad6ea6b0", x"49a7df7d", x"9cee60b8", x"8fedb266",
    x"ecaa8c71", x"699a17ff", x"5664526c", x"c2b19ee1",
    x"193602a5", x"75094c29", x"a0591340", x"e4183a3e",
    x"3f54989a", x"5b429d65", x"6b8fe4d6", x"99f73fd6",
    x"a1d29c07", x"efe830f5", x"4d2d38e6", x"f0255dc1",
    x"4cdd2086", x"8470eb26", x"6382e9c6", x"021ecc5e",
    x"09686b3f", x"3ebaefc9", x"3c971814", x"6b6a70a1",
    x"687f3584", x"52a0e286", x"b79c5305", x"aa500737",
    x"3e07841c", x"7fdeae5c", x"8e7d44ec", x"5716f2b8",
    x"b03ada37", x"f0500c0d", x"f01c1f04", x"0200b3ff",
    x"ae0cf51a", x"3cb574b2", x"25837a58", x"dc0921bd",
    x"d19113f9", x"7ca92ff6", x"94324773", x"22f54701",
    x"3ae5e581", x"37c2dadc", x"c8b57634", x"9af3dda7",
    x"a9446146", x"0fd0030e", x"ecc8c73e", x"a4751e41",
    x"e238cd99", x"3bea0e2f", x"3280bba1", x"183eb331",
    x"4e548b38", x"4f6db908", x"6f420d03", x"f60a04bf",
    x"2cb81290", x"24977c79", x"5679b072", x"bcaf89af",
    x"de9a771f", x"d9930810", x"b38bae12", x"dccf3f2e",
    x"5512721f", x"2e6b7124", x"501adde6", x"9f84cd87",
    x"7a584718", x"7408da17", x"bc9f9abc", x"e94b7d8c",
    x"ec7aec3a", x"db851dfa", x"63094366", x"c464c3d2",
    x"ef1c1847", x"3215d908", x"dd433b37", x"24c2ba16",
    x"12a14d43", x"2a65c451", x"50940002", x"133ae4dd",
    x"71dff89e", x"10314e55", x"81ac77d6", x"5f11199b",
    x"043556f1", x"d7a3c76b", x"3c11183b", x"5924a509",
    x"f28fe6ed", x"97f1fbfa", x"9ebabf2c", x"1e153c6e",
    x"86e34570", x"eae96fb1", x"860e5e0a", x"5a3e2ab3",
    x"771fe71c", x"4e3d06fa", x"2965dcb9", x"99e71d0f",
    x"803e89d6", x"5266c825", x"2e4cc978", x"9c10b36a",
    x"c6150eba", x"94e2ea78", x"a5fc3c53", x"1e0a2df4",
    x"f2f74ea7", x"361d2b3d", x"1939260f", x"19c27960",
    x"5223a708", x"f71312b6", x"ebadfe6e", x"eac31f66",
    x"e3bc4595", x"a67bc883", x"b17f37d1", x"018cff28",
    x"c332ddef", x"be6c5aa5", x"65582185", x"68ab9802",
    x"eecea50f", x"db2f953b", x"2aef7dad", x"5b6e2f84",
    x"1521b628", x"29076170", x"ecdd4775", x"619f1510",
    x"13cca830", x"eb61bd96", x"0334fe1e", x"aa0363cf",
    x"b5735c90", x"4c70a239", x"d59e9e0b", x"cbaade14",
    x"eecc86bc", x"60622ca7", x"9cab5cab", x"b2f3846e",
    x"648b1eaf", x"19bdf0ca", x"a02369b9", x"655abb50",
    x"40685a32", x"3c2ab4b3", x"319ee9d5", x"c021b8f7",
    x"9b540b19", x"875fa099", x"95f7997e", x"623d7da8",
    x"f837889a", x"97e32d77", x"11ed935f", x"16681281",
    x"0e358829", x"c7e61fd6", x"96dedfa1", x"7858ba99",
    x"57f584a5", x"1b227263", x"9b83c3ff", x"1ac24696",
    x"cdb30aeb", x"532e3054", x"8fd948e4", x"6dbc3128",
    x"58ebf2ef", x"34c6ffea", x"fe28ed61", x"ee7c3c73",
    x"5d4a14d9", x"e864b7e3", x"42105d14", x"203e13e0",
    x"45eee2b6", x"a3aaabea", x"db6c4f15", x"facb4fd0",
    x"c742f442", x"ef6abbb5", x"654f3b1d", x"41cd2105",
    x"d81e799e", x"86854dc7", x"e44b476a", x"3d816250",
    x"cf62a1f2", x"5b8d2646", x"fc8883a0", x"c1c7b6a3",
    x"7f1524c3", x"69cb7492", x"47848a0b", x"5692b285",
    x"095bbf00", x"ad19489d", x"1462b174", x"23820e00",
    x"58428d2a", x"0c55f5ea", x"1dadf43e", x"233f7061",
    x"3372f092", x"8d937e41", x"d65fecf1", x"6c223bdb",
    x"7cde3759", x"cbee7460", x"4085f2a7", x"ce77326e",
    x"a6078084", x"19f8509e", x"e8efd855", x"61d99735",
    x"a969a7aa", x"c50c06c2", x"5a04abfc", x"800bcadc",
    x"9e447a2e", x"c3453484", x"fdd56705", x"0e1e9ec9",
    x"db73dbd3", x"105588cd", x"675fda79", x"e3674340",
    x"c5c43465", x"713e38d8", x"3d28f89e", x"f16dff20",
    x"153e21e7", x"8fb03d4a", x"e6e39f2b", x"db83adf7",

    -- S-Box #3
    x"e93d5a68", x"948140f7", x"f64c261c", x"94692934",
    x"411520f7", x"7602d4f7", x"bcf46b2e", x"d4a20068",
    x"d4082471", x"3320f46a", x"43b7d4b7", x"500061af",
    x"1e39f62e", x"97244546", x"14214f74", x"bf8b8840",
    x"4d95fc1d", x"96b591af", x"70f4ddd3", x"66a02f45",
    x"bfbc09ec", x"03bd9785", x"7fac6dd0", x"31cb8504",
    x"96eb27b3", x"55fd3941", x"da2547e6", x"abca0a9a",
    x"28507825", x"530429f4", x"0a2c86da", x"e9b66dfb",
    x"68dc1462", x"d7486900", x"680ec0a4", x"27a18dee",
    x"4f3ffea2", x"e887ad8c", x"b58ce006", x"7af4d6b6",
    x"aace1e7c", x"d3375fec", x"ce78a399", x"406b2a42",
    x"20fe9e35", x"d9f385b9", x"ee39d7ab", x"3b124e8b",
    x"1dc9faf7", x"4b6d1856", x"26a36631", x"eae397b2",
    x"3a6efa74", x"dd5b4332", x"6841e7f7", x"ca7820fb",
    x"fb0af54e", x"d8feb397", x"454056ac", x"ba489527",
    x"55533a3a", x"20838d87", x"fe6ba9b7", x"d096954b",
    x"55a867bc", x"a1159a58", x"cca92963", x"99e1db33",
    x"a62a4a56", x"3f3125f9", x"5ef47e1c", x"9029317c",
    x"fdf8e802", x"04272f70", x"80bb155c", x"05282ce3",
    x"95c11548", x"e4c66d22", x"48c1133f", x"c70f86dc",
    x"07f9c9ee", x"41041f0f", x"404779a4", x"5d886e17",
    x"325f51eb", x"d59bc0d1", x"f2bcc18f", x"41113564",
    x"257b7834", x"602a9c60", x"dff8e8a3", x"1f636c1b",
    x"0e12b4c2", x"02e1329e", x"af664fd1", x"cad18115",
    x"6b2395e0", x"333e92e1", x"3b240b62", x"eebeb922",
    x"85b2a20e", x"e6ba0d99", x"de720c8c", x"2da2f728",
    x"d0127845", x"95b794fd", x"647d0862", x"e7ccf5f0",
    x"5449a36f", x"877d48fa", x"c39dfd27", x"f33e8d1e",
    x"0a476341", x"992eff74", x"3a6f6eab", x"f4f8fd37",
    x"a812dc60", x"a1ebddf8", x"991be14c", x"db6e6b0d",
    x"c67b5510", x"6d672c37", x"2765d43b", x"dcd0e804",
    x"f1290dc7", x"cc00ffa3", x"b5390f92", x"690fed0b",
    x"667b9ffb", x"cedb7d9c", x"a091cf0b", x"d9155ea3",
    x"bb132f88", x"515bad24", x"7b9479bf", x"763bd6eb",
    x"37392eb3", x"cc115979", x"8026e297", x"f42e312d",
    x"6842ada7", x"c66a2b3b", x"12754ccc", x"782ef11c",
    x"6a124237", x"b79251e7", x"06a1bbe6", x"4bfb6350",
    x"1a6b1018", x"11caedfa", x"3d25bdd8", x"e2e1c3c9",
    x"44421659", x"0a121386", x"d90cec6e", x"d5abea2a",
    x"64af674e", x"da86a85f", x"bebfe988", x"64e4c3fe",
    x"9dbc8057", x"f0f7c086", x"60787bf8", x"6003604d",
    x"d1fd8346", x"f6381fb0", x"7745ae04", x"d736fccc",
    x"83426b33", x"f01eab71", x"b0804187", x"3c005e5f",
    x"77a057be", x"bde8ae24", x"55464299", x"bf582e61",
    x"4e58f48f", x"f2ddfda2", x"f474ef38", x"8789bdc2",
    x"5366f9c3", x"c8b38e74", x"b475f255", x"46fcd9b9",
    x"7aeb2661", x"8b1ddf84", x"846a0e79", x"915f95e2",
    x"466e598e", x"20b45770", x"8cd55591", x"c902de4c",
    x"b90bace1", x"bb8205d0", x"11a86248", x"7574a99e",
    x"b77f19b6", x"e0a9dc09", x"662d09a1", x"c4324633",
    x"e85a1f02", x"09f0be8c", x"4a99a025", x"1d6efe10",
    x"1ab93d1d", x"0ba5a4df", x"a186f20f", x"2868f169",
    x"dcb7da83", x"573906fe", x"a1e2ce9b", x"4fcd7f52",
    x"50115e01", x"a70683fa", x"a002b5c4", x"0de6d027",
    x"9af88c27", x"773f8641", x"c3604c06", x"61a806b5",
    x"f0177a28", x"c0f586e0", x"006058aa", x"30dc7d62",
    x"11e69ed7", x"2338ea63", x"53c2dd94", x"c2c21634",
    x"bbcbee56", x"90bcb6de", x"ebfc7da1", x"ce591d76",
    x"6f05e409", x"4b7c0188", x"39720a3d", x"7c927c24",
    x"86e3725f", x"724d9db9", x"1ac15bb4", x"d39eb8fc",
    x"ed545578", x"08fca5b5", x"d83d7cd3", x"4dad0fc4",
    x"1e50ef5e", x"b161e6f8", x"a28514d9", x"6c51133c",
    x"6fd5c7e7", x"56e14ec4", x"362abfce", x"ddc6c837",
    x"d79a3234", x"92638212", x"670efa8e", x"406000e0",

    -- S-Box #4
    x"3a39ce37", x"d3faf5cf", x"abc27737", x"5ac52d1b",
    x"5cb0679e", x"4fa33742", x"d3822740", x"99bc9bbe",
    x"d5118e9d", x"bf0f7315", x"d62d1c7e", x"c700c47b",
    x"b78c1b6b", x"21a19045", x"b26eb1be", x"6a366eb4",
    x"5748ab2f", x"bc946e79", x"c6a376d2", x"6549c2c8",
    x"530ff8ee", x"468dde7d", x"d5730a1d", x"4cd04dc6",
    x"2939bbdb", x"a9ba4650", x"ac9526e8", x"be5ee304",
    x"a1fad5f0", x"6a2d519a", x"63ef8ce2", x"9a86ee22",
    x"c089c2b8", x"43242ef6", x"a51e03aa", x"9cf2d0a4",
    x"83c061ba", x"9be96a4d", x"8fe51550", x"ba645bd6",
    x"2826a2f9", x"a73a3ae1", x"4ba99586", x"ef5562e9",
    x"c72fefd3", x"f752f7da", x"3f046f69", x"77fa0a59",
    x"80e4a915", x"87b08601", x"9b09e6ad", x"3b3ee593",
    x"e990fd5a", x"9e34d797", x"2cf0b7d9", x"022b8b51",
    x"96d5ac3a", x"017da67d", x"d1cf3ed6", x"7c7d2d28",
    x"1f9f25cf", x"adf2b89b", x"5ad6b472", x"5a88f54c",
    x"e029ac71", x"e019a5e6", x"47b0acfd", x"ed93fa9b",
    x"e8d3c48d", x"283b57cc", x"f8d56629", x"79132e28",
    x"785f0191", x"ed756055", x"f7960e44", x"e3d35e8c",
    x"15056dd4", x"88f46dba", x"03a16125", x"0564f0bd",
    x"c3eb9e15", x"3c9057a2", x"97271aec", x"a93a072a",
    x"1b3f6d9b", x"1e6321f5", x"f59c66fb", x"26dcf319",
    x"7533d928", x"b155fdf5", x"03563482", x"8aba3cbb",
    x"28517711", x"c20ad9f8", x"abcc5167", x"ccad925f",
    x"4de81751", x"3830dc8e", x"379d5862", x"9320f991",
    x"ea7a90c2", x"fb3e7bce", x"5121ce64", x"774fbe32",
    x"a8b6e37e", x"c3293d46", x"48de5369", x"6413e680",
    x"a2ae0810", x"dd6db224", x"69852dfd", x"09072166",
    x"b39a460a", x"6445c0dd", x"586cdecf", x"1c20c8ae",
    x"5bbef7dd", x"1b588d40", x"ccd2017f", x"6bb4e3bb",
    x"dda26a7e", x"3a59ff45", x"3e350a44", x"bcb4cdd5",
    x"72eacea8", x"fa6484bb", x"8d6612ae", x"bf3c6f47",
    x"d29be463", x"542f5d9e", x"aec2771b", x"f64e6370",
    x"740e0d8d", x"e75b1357", x"f8721671", x"af537d5d",
    x"4040cb08", x"4eb4e2cc", x"34d2466a", x"0115af84",
    x"e1b00428", x"95983a1d", x"06b89fb4", x"ce6ea048",
    x"6f3f3b82", x"3520ab82", x"011a1d4b", x"277227f8",
    x"611560b1", x"e7933fdc", x"bb3a792b", x"344525bd",
    x"a08839e1", x"51ce794b", x"2f32c9b7", x"a01fbac9",
    x"e01cc87e", x"bcc7d1f6", x"cf0111c3", x"a1e8aac7",
    x"1a908749", x"d44fbd9a", x"d0dadecb", x"d50ada38",
    x"0339c32a", x"c6913667", x"8df9317c", x"e0b12b4f",
    x"f79e59b7", x"43f5bb3a", x"f2d519ff", x"27d9459c",
    x"bf97222c", x"15e6fc2a", x"0f91fc71", x"9b941525",
    x"fae59361", x"ceb69ceb", x"c2a86459", x"12baa8d1",
    x"b6c1075e", x"e3056a0c", x"10d25065", x"cb03a442",
    x"e0ec6e0e", x"1698db3b", x"4c98a0be", x"3278e964",
    x"9f1f9532", x"e0d392df", x"d3a0342b", x"8971f21e",
    x"1b0a7441", x"4ba3348c", x"c5be7120", x"c37632d8",
    x"df359f8d", x"9b992f2e", x"e60b6f47", x"0fe3f11d",
    x"e54cda54", x"1edad891", x"ce6279cf", x"cd3e7e6f",
    x"1618b166", x"fd2c1d05", x"848fd2c5", x"f6fb2299",
    x"f523f357", x"a6327623", x"93a83531", x"56cccd02",
    x"acf08162", x"5a75ebb5", x"6e163697", x"88d273cc",
    x"de966292", x"81b949d0", x"4c50901b", x"71c65614",
    x"e6c6c7bd", x"327a140a", x"45e1d006", x"c3f27b9a",
    x"c9aa53fd", x"62a80f00", x"bb25bfe2", x"35bdd2f6",
    x"71126905", x"b2040222", x"b6cbcf7c", x"cd769c2b",
    x"53113ec0", x"1640e3d3", x"38abbd60", x"2547adf0",
    x"ba38209c", x"f746ce76", x"77afa1c5", x"20756060",
    x"85cbfe4e", x"8ae88dd8", x"7aaaf9b0", x"4cf9aa7e",
    x"1948c25c", x"02fb8a8c", x"01c36ae4", x"d6ebe1f9",
    x"90d4f869", x"a65cdea0", x"3f09252d", x"c208e69f",
    x"b74e6132", x"ce77e25b", x"578fdfe3", x"3ac372e6"
    );

end architecture;
