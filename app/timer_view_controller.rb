class TimerViewController < UIViewController
  def viewDidLoad
    super
    @label = UILabel.alloc.initWithFrame(CGRectMake(10,10,200,30))
    @label.textAlignment = UITextAlignmentCenter
    @timer = NSTimer.scheduledTimerWithTimeInterval(1,target:self,selector:'updateLabel:',userInfo:nil,repeats:true)

  end

  def viewWillAppear(animated)
    super
    view.backgroundColor = UIColor.whiteColor
    view.addSubview(@label)
    @label.center = @label.superview.center
    @startTime = NSDate.date
  end

  def updateLabel(timer)
    @label.text = updatedTime(@timer)
  end

  def updatedTime(timer)
    #firedate = timer.firedate
    #firedate.timeIntervalSinceNow
    seconds_elapsed = -(@startTime.timeIntervalSinceNow).intValue
    number_of_seconds = seconds_elapsed % 3600 % 60 < 10 ? "0#{seconds_elapsed % 3600 % 60}" : seconds_elapsed % 3600 % 60

    # takes advantage of strict integer division
    number_of_minutes = (seconds_elapsed % 3600)/60 < 10 ? "0#{(seconds_elapsed % 3600)/60}" : (seconds_elapsed % 3600)/60
    number_of_hrs = (seconds_elapsed/3600) < 10 ? "0#{(seconds_elapsed/3600)}" : (seconds_elapsed/3600)
    "#{seconds_elapsed}  =  #{number_of_hrs}:#{number_of_minutes}:#{number_of_seconds}"
  end

end