function make_freq_plot(x, Fs)

% make a frequency domain plot with frequency labels


if(mod(length(x),2) ~=0)
    x = x(1:end-1);
end

freq = linspace(-Fs/2, Fs/2-Fs/length(x),length(x));
mag = 1/length(x)*fftshift(abs(fft(x)));

surpress = freq < -3.5 | freq > 3.5;
mag(surpress) = mag(surpress)/100;
zero = freq == 0;
mag(zero) = mag(zero)/100;
plot(freq , mag)

ylabel('Magnitude of signal');
xlabel('Frequency (Hz)');