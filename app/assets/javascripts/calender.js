$(function () {
	// 画面遷移を検知
	$(document).on('turbolinks:load', function () {
			// lengthを呼び出すことで、#calendarが存在していた場合はtrueの処理がされ、無い場合はnillを返す
			if ($('#calendar').length) {
					function eventCalendar() {
							return $('#calendar').fullCalendar({
							});
					};
					function clearCalendar() {
							$('#calendar').html('');
					};

					$(document).on('turbolinks:load', function () {
							eventCalendar();
					});
					$(document).on('turbolinks:before-cache', clearCalendar);

					$('#calendar').fullCalendar({
							events: '/events.json',
							titleFormat: 'YYYY年 M月',
							dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
							header: {
								left:'',
								center: 'title',
								right: 'today prev,next'
							},
							defaultTimedEventDuration: '03:00:00',
							timeZone: 'Asia/Tokyo',
							locale: 'ja',
							buttonText: {
								prev: '先月',
								next: '来月',
								prevYear: '前年',
								nextYear: '翌年',
								today: '今日',
								month: '月',
								week: '週',
                    day: '日'
                },
                timeFormat: "HH:mm",
                eventColor: '#63ceef',
                eventTextColor: '#000000',
					});
			}
	});
});