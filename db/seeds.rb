# frozen_string_literal: true

# Destroy anything past data for seed run

Role.destroy_all
User.destroy_all
Activity.destroy_all
Testimonial.destroy_all
Category.destroy_all
News.destroy_all

# Seed actions

Role.create(
  [
    {
      name: 'Admin',
      description: 'Admin role'
    },
    {
      name: 'User',
      description: 'User role'
    }
  ]
)

User.create(
  first_name: 'Admin',
  last_name: 'User',
  email: 'admin-ong@ong.com',
  password: 'adminong',
  role_id: 1
)

10.times do |i|
  User.create(
    first_name: 'User',
    last_name: "##{i}",
    email: "test-ong-#{i}@ong.com",
    password: '123456',
    role_id: 2
  )
end

Testimonial.create(
  [
    {
      name: 'Cecilia',
      content: 'Se nota el esfuerzo que hay detras de las actividades
      que ofrecen para ayudar a chicos que realmente lo necesitan.'
    },
    {
      name: 'Marcos',
      content: 'Considero un gran logro la integración escolar de niños y
      jóvenes del barrio tanto socioeducativo como emocional.'
    },
    {
      name: 'Maria',
      content: 'Buena iniciativa de parte del grupo de voluntarios que recibe
      a los niños para ayudarlos a estudiar o hacer la tarea.'
    }
  ]
)

familyCategory = Category.create!(name: 'Familia', description: 'Programa de ayuda para las familias')

familyCategory.news.create!(name: 'Bienvenidas Familias!', content: 'Gracias a todas las familias nuevas que confian en nosotros')

educationCategory = Category.create!(name: 'Educacion', description: 'Programa de ayuda para los jovenes')

educationCategory.news.create!(name: 'Nuevo espacio para los adolecentes', content: 'Presentamos nuevos horarios
  por la noche para aquellos jovenes que no pueden asistir a los turnos de la mañana o tarde')

Activity.create!(
  [
    {
      name: 'Apoyo escolar nivel Primario',
      content: 'El espacio de apoyo escolar es el corazón del área educativa.
      Se realizan los talleres de lunes a jueves de 10 a 12 hs y de 14 a 16 hs
      en el contraturno,
      Los sábados también se realiza el taller para niños y niñas que asisten
      a la escuela doble turno. Tenemos un espacio especial para los de 1er
      grado 2 veces por semana ya que ellos necesitan atención especial!
      Actualmente se encuentran inscriptos a este programa 150 niños y niñas de
      6 a 15 años. Este taller está pensado para ayudar a los alumnos con el
      material que traen de la escuela, también tenemos una docente que les da
      clases de lengua y matemática con una planificación propia que armamos
      en Manos para nivelar a los niños y que vayan con más herramientas a la
      escuela.'
    },
    {
      name: 'Apoyo escolar nivel Secundaria',
      content: 'Del mismo modo que en primaria, este taller es el corazón del
      área secundaria. Se realizan talleres de lunes a viernes de 10 a 12 hs y
      de 16 a 18 hs en el contraturno. Actualmente se encuentran inscriptos en
      el taller 50 adolescentes entre 13 y 20 años. Aquí los jóvenes se
      presentan con el material que traen del colegio y una docente de la
      institución y un grupo de voluntarios los recibe para ayudarlos a
      estudiar o hacer la tarea. Este espacio también es utilizado por los
      jóvenes como un punto de encuentro y relación entre ellos y la
      institución.'
    },
    {
      name: 'Tutorías',
      content: 'Es un programa destinado a jóvenes a partir del tercer año de
      secundaria, cuyo objetivo es garantizar su permanencia en la escuela y
      construir un proyecto de vida que da sentido al colegio.
      El objetivo de esta propuesta es lograr la integración escolar de niños y
      jóvenes del barrio promoviendo el soporte socioeducativo y emocional
      apropiado, desarrollando los recursos institucionales necesarios a través
      de la articulación de nuestras intervenciones con las escuelas que los
      alojan, con las familias de los alumnos y con las instancias municipales,
      provinciales y nacionales que correspondan.'
    }
  ]
)

# log of before actions

Rails.logger.info "Created #{Role.count} roles"
Rails.logger.info "Created #{User.count} users"
Rails.logger.info "Created #{Activity.count} activities"
Rails.logger.info "Created #{Testimonial.count} testimonials"
Rails.logger.info "Created #{Category.count} categories"
Rails.logger.info "Created #{News.count} news"
