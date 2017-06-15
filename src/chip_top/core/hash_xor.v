module hash_xor (
  input [1023:0] hash_i,
  output reg [1023:0] hash_xor_o
);

always @(*) begin
  hash_xor_o[1023:960] = hash_i[1023:960] ^ 64'h5b4da95f5fa08280;
  hash_xor_o[959:896] = hash_i[959:896] ^ 64'hfc9879df44f418c8;
  hash_xor_o[895:832] = hash_i[895:832] ^ 64'hf9f12ba424b7757d;
  hash_xor_o[831:768] = hash_i[831:768] ^ 64'he02bbdfbae0d4c4f;
  hash_xor_o[767:704] = hash_i[767:704] ^ 64'hdf9317c80cc5fe04;
  hash_xor_o[703:640] = hash_i[703:640] ^ 64'hc6429073466cf297;
  hash_xor_o[639:576] = hash_i[639:576] ^ 64'h06b8c25999ddd2f6;
  hash_xor_o[575:512] = hash_i[575:512] ^ 64'h540d4475cc977b87;
  hash_xor_o[511:448] = hash_i[511:448] ^ 64'hf4757be023f19b8f;
  hash_xor_o[447:384] = hash_i[447:384] ^ 64'h4035d7722886b788;
  hash_xor_o[383:320] = hash_i[383:320] ^ 64'h69826de916a79cf9;
  hash_xor_o[319:256] = hash_i[319:256] ^ 64'hc94cc79cd4347d24;
  hash_xor_o[255:192] = hash_i[255:192] ^ 64'hb567aa3e2390a573;
  hash_xor_o[191:128] = hash_i[191:128] ^ 64'ha373a48a5e676640;
  hash_xor_o[127:64] = hash_i[127:64] ^ 64'hc79cc70197e1c5e7;
  hash_xor_o[63:0] = hash_i[63:0] ^ 64'hf902fb53ca1858b6;
end

endmodule
