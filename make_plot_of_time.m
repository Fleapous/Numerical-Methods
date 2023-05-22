function make_plot_of_time(max_size)
sizes = 1:50:max_size;
times = zeros(1, length(sizes));

for idx = 1:length(sizes)
    size = sizes(idx);
    A = Hessenberg(size);
    [~, ~, ~, ~, time] = det_and_cond_f_timed(A);
    
    times(idx) = time;
end

plot(sizes, times, 'b-', 'LineWidth', 2);
xlabel('Matrix Size');
ylabel('Time (seconds)');
title('Time taken vs. Matrix Size');
grid on;
end
