%{
Bu program kullanıcıdan ilk olarak toplam alan sayısı ve taralı alan
sayısını alır.
kullanıcıya sorulan taralı alanın (x,y) değeri taralı olmayan alanın taralı
alandan çıkartılmadan önceki ağırlık merkezi koordinatlarıdır. daha
açıklayıcı bir tanım bulamadığım için girilecek değeri bu şekilde
adlandırdım.
koordinatlar ve alanlar girildikten sonra taralı alan , taralı alanın
ağırlık merkezinin x değeriyle çarpılır ardından boş alan, boş alanın x
değeriyle çarpılarak ilk işlemden çıkartılır. ortay çıkan sonuç taralı
alana bölünerek toplam taralı cismin ağırlık merkezi x ekseni için
hesaplanır. Aynı işlem y değeri için de yapılır.
merkez_X = (total_tarali_XcAc - total_non_tarali_XcAc) / (total_tarali_Ac - total_non_tarali_Ac);

%}
% kullanıcıdan tarali ve taralı olmayan bölüm sayılarını alıyoruz
total_bolumler = input('Kaç tane bölüm olduğunu girin:\n');
num_tarali = input('Kaç tane taralı alan var ? : \n');
num_tarali_olmayan = total_bolumler - num_tarali;

if num_tarali > total_bolumler
    disp("taralı olan sayısı toplam alan sayısından büyük olamaz");
end

Xc = zeros(total_bolumler, 1);
Yc = zeros(total_bolumler, 1);
Ac = zeros(total_bolumler, 1);

% taralı alanlar için Xc Yc ve Ac değerlerini kullanıcıdan alıyoruz
for i = 1:num_tarali
    disp('-----  Gireceginiz degerler ondalıklıysa xxx.xx şeklinde girin örneğin (-233.156) gibi :')
    Xc(i) = input(['Taralı olan alan ', num2str(i), ' için Xc değerini girin : ']);
    Yc(i) = input(['Taralı olan alan ', num2str(i), ' için Yc değerini girin : ']);
    Ac(i) = input(['Taralı olan alan ', num2str(i), ' için Alan değerini girin : ']);
end

% taralı olmayan alanlar için Xc Yc ve Ac değerlerini alıyoruz
for i = 1:num_tarali_olmayan
    Xc(num_tarali+i) = input(['Taralı olmayan alan ', num2str(i), ' için Xc değerini girin : ']);
    Yc(num_tarali+i) = input(['Taralı olmayan alan ', num2str(i), ' için Yc değerini girin : ']);
    Ac(num_tarali+i) = input(['Taralı olmayan alan ', num2str(i), ' için Alan değerini girin : ']);
end

%taralı alanların Xc*Ac değerlerini toplamını hesaplıyoruz
total_tarali_XcAc = sum(Xc(1:num_tarali) .* Ac(1:num_tarali));

%taralı olmayan alanların Xc*Ac değerlerini çıkarıyoruz
total_non_tarali_XcAc = sum(Xc(num_tarali+1:end) .* Ac(num_tarali+1:end));

%taralı alanların toplam alanını hesaplıyoruz
total_tarali_Ac = sum(Ac(1:num_tarali));

%taralı olmayan alanların toplam alanını hesaplıyoruz
total_non_tarali_Ac = sum(Ac(num_tarali+1:end));

% ağırlık merkezi koordinatlarını hesaplıyoruz
merkez_X = (total_tarali_XcAc - total_non_tarali_XcAc) / (total_tarali_Ac - total_non_tarali_Ac);
merkez_Y = (sum(Yc(1:num_tarali) .* Ac(1:num_tarali)) - sum(Yc(num_tarali+1:end) .* Ac(num_tarali+1:end))) / (total_tarali_Ac - total_non_tarali_Ac);

fprintf('\nTablo:\n');
fprintf('%-12s \t %-12s \t %-12s \t %-12s \t %-12s \n', 'XC', 'YC', 'AC', 'Xc*Ac', 'Yc*Ac');
fprintf('--------------------------------------------------\n');
for i = 1:total_bolumler
    fprintf('%-12.2f \t %-12.2f \t %-12.2f \t %-12.2f \t %-12.2f \n', Xc(i), Yc(i), Ac(i), Xc(i)*Ac(i), Yc(i)*Ac(i));
end
fprintf('--------------------------------------------------\n');

fprintf('\nAğırlık Merkezi Koordinatları:\n');
fprintf('Xc: %.2f\n', merkez_X);
fprintf('Yc: %.2f\n', merkez_Y);
