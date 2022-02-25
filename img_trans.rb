require 'mini_magick'   

image = MiniMagick::Image.open(ARGV[0])

ARGV.each do |arg|
    case 
    when arg == "to_black_and_white"
        puts "Para preto e branco"
        image.colorspace 'gray'
    when arg.include?("resize")
        puts 'Tamanho alterado'
        image.resize arg.split("=")[1]
    when arg.include?("watermark")
        image.combine_options do |c| 
            c.gravity "West"
            c.draw "image Over 0,0 0,0 #{arg.split("=")[1]}"
        end
    end
end
image.write('output.jpg')