--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: attendance_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.attendance_status AS ENUM (
    'present',
    'absent',
    'late',
    'excused'
);


ALTER TYPE public.attendance_status OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: announcements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.announcements (
    id bigint NOT NULL,
    classroom_id bigint,
    title character varying,
    content text,
    created_by bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.announcements OWNER TO postgres;

--
-- Name: assignment_submissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assignment_submissions (
    id bigint NOT NULL,
    assignment_id bigint,
    student_id bigint,
    file_url text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.assignment_submissions OWNER TO postgres;

--
-- Name: assignments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assignments (
    id bigint NOT NULL,
    classroom_id bigint,
    title character varying,
    description text,
    file_url text,
    deadline timestamp without time zone,
    created_by bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.assignments OWNER TO postgres;

--
-- Name: attendances; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attendances (
    id bigint NOT NULL,
    schedule_id bigint,
    user_id bigint,
    status public.attendance_status,
    checked_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.attendances OWNER TO postgres;

--
-- Name: classroom_mentors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classroom_mentors (
    id bigint NOT NULL,
    classroom_id bigint,
    mentor_id bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.classroom_mentors OWNER TO postgres;

--
-- Name: classroom_students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classroom_students (
    id bigint NOT NULL,
    classroom_id bigint,
    student_id bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.classroom_students OWNER TO postgres;

--
-- Name: classrooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classrooms (
    id bigint NOT NULL,
    name character varying,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.classrooms OWNER TO postgres;

--
-- Name: feedbacks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feedbacks (
    id bigint NOT NULL,
    classroom_id bigint,
    user_id bigint,
    message text,
    rating integer,
    created_at timestamp without time zone,
    CONSTRAINT feedbacks_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE public.feedbacks OWNER TO postgres;

--
-- Name: forum_posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forum_posts (
    id bigint NOT NULL,
    forum_id bigint,
    user_id bigint,
    content text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.forum_posts OWNER TO postgres;

--
-- Name: forums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forums (
    id bigint NOT NULL,
    classroom_id bigint,
    title character varying,
    created_by bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.forums OWNER TO postgres;

--
-- Name: grades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grades (
    id bigint NOT NULL,
    student_id bigint,
    assignment_id bigint,
    grade numeric,
    feedback text,
    graded_by bigint,
    graded_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.grades OWNER TO postgres;

--
-- Name: material_classrooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.material_classrooms (
    id bigint NOT NULL,
    material_id bigint,
    classroom_id bigint,
    created_at timestamp without time zone
);


ALTER TABLE public.material_classrooms OWNER TO postgres;

--
-- Name: materials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materials (
    id bigint NOT NULL,
    title character varying,
    file_url text,
    uploaded_by bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.materials OWNER TO postgres;

--
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    id bigint NOT NULL,
    user_id bigint,
    announcement_id bigint,
    is_read boolean DEFAULT false,
    created_at timestamp without time zone
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- Name: schedules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schedules (
    id bigint NOT NULL,
    classroom_id bigint,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    topic character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.schedules OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying,
    email character varying,
    password character varying,
    role character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: announcements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.announcements (id, classroom_id, title, content, created_by, created_at, updated_at) FROM stdin;
1	1	Mulai Besok	Kelas akan dimulai pukul 09.00	3	2025-06-03 19:34:21.737737	2025-06-03 19:34:21.737737
2	2	Update Materi	Materi Python diupdate	5	2025-06-03 19:34:21.737737	2025-06-03 19:34:21.737737
3	3	Review Tugas	Mentor akan mereview	3	2025-06-03 19:34:21.737737	2025-06-03 19:34:21.737737
4	4	Jadwal Ujian	Ujian minggu depan	5	2025-06-03 19:34:21.737737	2025-06-03 19:34:21.737737
5	5	CI/CD Live	Live coding hari Jumat	3	2025-06-03 19:34:21.737737	2025-06-03 19:34:21.737737
\.


--
-- Data for Name: assignment_submissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assignment_submissions (id, assignment_id, student_id, file_url, created_at, updated_at) FROM stdin;
1	1	1	url/submission1.pdf	2025-06-03 19:33:25.226298	2025-06-03 19:33:25.226298
2	1	2	url/submission2.pdf	2025-06-03 19:33:25.226298	2025-06-03 19:33:25.226298
3	2	4	url/submission3.pdf	2025-06-03 19:33:25.226298	2025-06-03 19:33:25.226298
4	3	1	url/submission4.pdf	2025-06-03 19:33:25.226298	2025-06-03 19:33:25.226298
5	5	2	url/submission5.pdf	2025-06-03 19:33:25.226298	2025-06-03 19:33:25.226298
\.


--
-- Data for Name: assignments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assignments (id, classroom_id, title, description, file_url, deadline, created_by, created_at, updated_at) FROM stdin;
1	1	HTML Task	Buat halaman HTML	url/html-task.pdf	2025-06-10 19:33:25.226298	3	2025-06-03 19:33:25.226298	2025-06-03 19:33:25.226298
2	2	Pandas Task	Analisis data	url/pandas-task.pdf	2025-06-10 19:33:25.226298	5	2025-06-03 19:33:25.226298	2025-06-03 19:33:25.226298
3	3	Mockup Task	Desain tampilan	url/mockup.pdf	2025-06-10 19:33:25.226298	3	2025-06-03 19:33:25.226298	2025-06-03 19:33:25.226298
4	4	Flutter App	Aplikasi mobile	url/flutter.pdf	2025-06-10 19:33:25.226298	5	2025-06-03 19:33:25.226298	2025-06-03 19:33:25.226298
5	5	CI/CD Task	Konfigurasikan pipeline	url/cicd.pdf	2025-06-10 19:33:25.226298	3	2025-06-03 19:33:25.226298	2025-06-03 19:33:25.226298
\.


--
-- Data for Name: attendances; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attendances (id, schedule_id, user_id, status, checked_at, updated_at) FROM stdin;
1	1	1	present	2025-06-03 19:34:21.737737	2025-06-03 19:34:21.737737
2	1	2	late	2025-06-03 19:34:21.737737	2025-06-03 19:34:21.737737
3	2	4	absent	2025-06-03 19:34:21.737737	2025-06-03 19:34:21.737737
4	3	1	present	2025-06-03 19:34:21.737737	2025-06-03 19:34:21.737737
5	5	2	excused	2025-06-03 19:34:21.737737	2025-06-03 19:34:21.737737
\.


--
-- Data for Name: classroom_mentors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classroom_mentors (id, classroom_id, mentor_id, created_at, updated_at) FROM stdin;
1	1	3	2025-06-03 19:32:24.407816	2025-06-03 19:32:24.407816
2	2	5	2025-06-03 19:32:24.407816	2025-06-03 19:32:24.407816
3	3	3	2025-06-03 19:32:24.407816	2025-06-03 19:32:24.407816
4	4	5	2025-06-03 19:32:24.407816	2025-06-03 19:32:24.407816
5	5	3	2025-06-03 19:32:24.407816	2025-06-03 19:32:24.407816
\.


--
-- Data for Name: classroom_students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classroom_students (id, classroom_id, student_id, created_at, updated_at) FROM stdin;
1	1	1	2025-06-03 19:32:35.494968	2025-06-03 19:32:35.494968
2	1	2	2025-06-03 19:32:35.494968	2025-06-03 19:32:35.494968
3	2	4	2025-06-03 19:32:35.494968	2025-06-03 19:32:35.494968
4	3	1	2025-06-03 19:32:35.494968	2025-06-03 19:32:35.494968
5	5	2	2025-06-03 19:32:35.494968	2025-06-03 19:32:35.494968
\.


--
-- Data for Name: classrooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classrooms (id, name, description, created_at, updated_at) FROM stdin;
1	Web Development	Kelas untuk belajar web	2025-06-03 19:31:11.498062	2025-06-03 19:31:11.498062
2	Data Science	Kelas analisis data	2025-06-03 19:31:11.498062	2025-06-03 19:31:11.498062
3	UI/UX Design	Kelas desain antarmuka	2025-06-03 19:31:11.498062	2025-06-03 19:31:11.498062
4	Mobile Dev	Kelas pengembangan mobile	2025-06-03 19:31:11.498062	2025-06-03 19:31:11.498062
5	DevOps	Kelas CI/CD dan deployment	2025-06-03 19:31:11.498062	2025-06-03 19:31:11.498062
\.


--
-- Data for Name: feedbacks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feedbacks (id, classroom_id, user_id, message, rating, created_at) FROM stdin;
1	1	1	Sangat bermanfaat!	5	2025-06-03 19:34:21.737737
2	1	2	Mentornya jelas	4	2025-06-03 19:34:21.737737
3	2	4	Data terlalu berat	3	2025-06-03 19:34:21.737737
4	3	1	Desain menarik	5	2025-06-03 19:34:21.737737
5	5	2	Perlu lebih banyak praktik	4	2025-06-03 19:34:21.737737
\.


--
-- Data for Name: forum_posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forum_posts (id, forum_id, user_id, content, created_at, updated_at) FROM stdin;
1	1	1	Saya bingung div tag	2025-06-03 19:34:21.737737	2025-06-03 19:34:21.737737
2	1	3	Coba pakai container	2025-06-03 19:34:21.737737	2025-06-03 19:34:21.737737
3	2	4	Apakah harus pakai pandas?	2025-06-03 19:34:21.737737	2025-06-03 19:34:21.737737
4	3	1	Saya pakai figma versi lama	2025-06-03 19:34:21.737737	2025-06-03 19:34:21.737737
5	5	2	Tool terbaik Jenkins atau GitLab?	2025-06-03 19:34:21.737737	2025-06-03 19:34:21.737737
\.


--
-- Data for Name: forums; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forums (id, classroom_id, title, created_by, created_at, updated_at) FROM stdin;
1	1	Diskusi HTML	1	2025-06-03 19:34:21.737737	2025-06-03 19:34:21.737737
2	2	Data Cleaning	4	2025-06-03 19:34:21.737737	2025-06-03 19:34:21.737737
3	3	Desain UI	1	2025-06-03 19:34:21.737737	2025-06-03 19:34:21.737737
4	4	Masalah Build	2	2025-06-03 19:34:21.737737	2025-06-03 19:34:21.737737
5	5	DevOps Tools	2	2025-06-03 19:34:21.737737	2025-06-03 19:34:21.737737
\.


--
-- Data for Name: grades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grades (id, student_id, assignment_id, grade, feedback, graded_by, graded_at, updated_at) FROM stdin;
1	1	1	90.5	Good job	3	2025-06-03 19:33:25.226298	2025-06-03 19:33:25.226298
2	2	1	85.0	Well done	3	2025-06-03 19:33:25.226298	2025-06-03 19:33:25.226298
3	4	2	88.0	Clean code	5	2025-06-03 19:33:25.226298	2025-06-03 19:33:25.226298
4	1	3	92.0	Creative design	3	2025-06-03 19:33:25.226298	2025-06-03 19:33:25.226298
5	2	5	80.0	Works fine	3	2025-06-03 19:33:25.226298	2025-06-03 19:33:25.226298
\.


--
-- Data for Name: material_classrooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.material_classrooms (id, material_id, classroom_id, created_at) FROM stdin;
1	1	1	2025-06-03 19:33:25.226298
2	2	1	2025-06-03 19:33:25.226298
3	3	2	2025-06-03 19:33:25.226298
4	4	3	2025-06-03 19:33:25.226298
5	5	5	2025-06-03 19:33:25.226298
\.


--
-- Data for Name: materials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materials (id, title, file_url, uploaded_by, created_at, updated_at) FROM stdin;
1	HTML Basics	url/html.pdf	3	2025-06-03 19:33:25.226298	2025-06-03 19:33:25.226298
2	CSS Design	url/css.pdf	5	2025-06-03 19:33:25.226298	2025-06-03 19:33:25.226298
3	Python for Data	url/python.pdf	3	2025-06-03 19:33:25.226298	2025-06-03 19:33:25.226298
4	Figma Guide	url/figma.pdf	3	2025-06-03 19:33:25.226298	2025-06-03 19:33:25.226298
5	Docker 101	url/docker.pdf	5	2025-06-03 19:33:25.226298	2025-06-03 19:33:25.226298
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, user_id, announcement_id, is_read, created_at) FROM stdin;
1	1	1	f	2025-06-03 19:34:21.737737
2	2	1	t	2025-06-03 19:34:21.737737
3	4	2	f	2025-06-03 19:34:21.737737
4	1	3	t	2025-06-03 19:34:21.737737
5	2	5	f	2025-06-03 19:34:21.737737
\.


--
-- Data for Name: schedules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schedules (id, classroom_id, start_time, end_time, topic, created_at, updated_at) FROM stdin;
1	1	2025-06-03 19:33:25.226298	2025-06-03 21:33:25.226298	Intro HTML	2025-06-03 19:33:25.226298	2025-06-03 19:33:25.226298
2	2	2025-06-03 19:33:25.226298	2025-06-03 21:33:25.226298	Data Cleaning	2025-06-03 19:33:25.226298	2025-06-03 19:33:25.226298
3	3	2025-06-03 19:33:25.226298	2025-06-03 21:33:25.226298	Wireframing	2025-06-03 19:33:25.226298	2025-06-03 19:33:25.226298
4	4	2025-06-03 19:33:25.226298	2025-06-03 21:33:25.226298	Android Setup	2025-06-03 19:33:25.226298	2025-06-03 19:33:25.226298
5	5	2025-06-03 19:33:25.226298	2025-06-03 21:33:25.226298	Docker Build	2025-06-03 19:33:25.226298	2025-06-03 19:33:25.226298
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, role, created_at, updated_at) FROM stdin;
1	Alice	alice@example.com	hashed_password	student	2025-06-03 19:31:01.144408	2025-06-03 19:31:01.144408
2	Bob	bob@example.com	hashed_password	student	2025-06-03 19:31:01.144408	2025-06-03 19:31:01.144408
3	Charlie	charlie@example.com	hashed_password	mentor	2025-06-03 19:31:01.144408	2025-06-03 19:31:01.144408
4	Diana	diana@example.com	hashed_password	student	2025-06-03 19:31:01.144408	2025-06-03 19:31:01.144408
5	Evan	evan@example.com	hashed_password	mentor	2025-06-03 19:31:01.144408	2025-06-03 19:31:01.144408
\.


--
-- Name: announcements announcements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_pkey PRIMARY KEY (id);


--
-- Name: assignment_submissions assignment_submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignment_submissions
    ADD CONSTRAINT assignment_submissions_pkey PRIMARY KEY (id);


--
-- Name: assignments assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_pkey PRIMARY KEY (id);


--
-- Name: attendances attendances_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendances
    ADD CONSTRAINT attendances_pkey PRIMARY KEY (id);


--
-- Name: classroom_mentors classroom_mentors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classroom_mentors
    ADD CONSTRAINT classroom_mentors_pkey PRIMARY KEY (id);


--
-- Name: classroom_students classroom_students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classroom_students
    ADD CONSTRAINT classroom_students_pkey PRIMARY KEY (id);


--
-- Name: classrooms classrooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classrooms
    ADD CONSTRAINT classrooms_pkey PRIMARY KEY (id);


--
-- Name: feedbacks feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (id);


--
-- Name: forum_posts forum_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_posts
    ADD CONSTRAINT forum_posts_pkey PRIMARY KEY (id);


--
-- Name: forums forums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forums
    ADD CONSTRAINT forums_pkey PRIMARY KEY (id);


--
-- Name: grades grades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (id);


--
-- Name: material_classrooms material_classrooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_classrooms
    ADD CONSTRAINT material_classrooms_pkey PRIMARY KEY (id);


--
-- Name: materials materials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: schedules schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: announcements announcements_classroom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_classroom_id_fkey FOREIGN KEY (classroom_id) REFERENCES public.classrooms(id);


--
-- Name: announcements announcements_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: assignment_submissions assignment_submissions_assignment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignment_submissions
    ADD CONSTRAINT assignment_submissions_assignment_id_fkey FOREIGN KEY (assignment_id) REFERENCES public.assignments(id);


--
-- Name: assignment_submissions assignment_submissions_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignment_submissions
    ADD CONSTRAINT assignment_submissions_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.users(id);


--
-- Name: assignments assignments_classroom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_classroom_id_fkey FOREIGN KEY (classroom_id) REFERENCES public.classrooms(id);


--
-- Name: assignments assignments_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: attendances attendances_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendances
    ADD CONSTRAINT attendances_schedule_id_fkey FOREIGN KEY (schedule_id) REFERENCES public.schedules(id);


--
-- Name: attendances attendances_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendances
    ADD CONSTRAINT attendances_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: classroom_mentors classroom_mentors_classroom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classroom_mentors
    ADD CONSTRAINT classroom_mentors_classroom_id_fkey FOREIGN KEY (classroom_id) REFERENCES public.classrooms(id);


--
-- Name: classroom_mentors classroom_mentors_mentor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classroom_mentors
    ADD CONSTRAINT classroom_mentors_mentor_id_fkey FOREIGN KEY (mentor_id) REFERENCES public.users(id);


--
-- Name: classroom_students classroom_students_classroom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classroom_students
    ADD CONSTRAINT classroom_students_classroom_id_fkey FOREIGN KEY (classroom_id) REFERENCES public.classrooms(id);


--
-- Name: classroom_students classroom_students_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classroom_students
    ADD CONSTRAINT classroom_students_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.users(id);


--
-- Name: feedbacks feedbacks_classroom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_classroom_id_fkey FOREIGN KEY (classroom_id) REFERENCES public.classrooms(id);


--
-- Name: feedbacks feedbacks_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: forum_posts forum_posts_forum_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_posts
    ADD CONSTRAINT forum_posts_forum_id_fkey FOREIGN KEY (forum_id) REFERENCES public.forums(id);


--
-- Name: forum_posts forum_posts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_posts
    ADD CONSTRAINT forum_posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: forums forums_classroom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forums
    ADD CONSTRAINT forums_classroom_id_fkey FOREIGN KEY (classroom_id) REFERENCES public.classrooms(id);


--
-- Name: forums forums_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forums
    ADD CONSTRAINT forums_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: grades grades_assignment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_assignment_id_fkey FOREIGN KEY (assignment_id) REFERENCES public.assignments(id);


--
-- Name: grades grades_graded_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_graded_by_fkey FOREIGN KEY (graded_by) REFERENCES public.users(id);


--
-- Name: grades grades_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.users(id);


--
-- Name: material_classrooms material_classrooms_classroom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_classrooms
    ADD CONSTRAINT material_classrooms_classroom_id_fkey FOREIGN KEY (classroom_id) REFERENCES public.classrooms(id);


--
-- Name: material_classrooms material_classrooms_material_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_classrooms
    ADD CONSTRAINT material_classrooms_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.materials(id);


--
-- Name: materials materials_uploaded_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_uploaded_by_fkey FOREIGN KEY (uploaded_by) REFERENCES public.users(id);


--
-- Name: notifications notifications_announcement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_announcement_id_fkey FOREIGN KEY (announcement_id) REFERENCES public.announcements(id);


--
-- Name: notifications notifications_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: schedules schedules_classroom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_classroom_id_fkey FOREIGN KEY (classroom_id) REFERENCES public.classrooms(id);


--
-- PostgreSQL database dump complete
--

